# frozen_string_literal: true

class FilesController < ApplicationController
  def index
    @files = @current_vendor_group.shared_files.page(params[:page]).per(10)
  end

  def new
    @file = @current_staff.shared_files.build
  end

  def show
    @file = SharedFile.find_by(uid: params[:uid])
  end

  def create
    vendor_group = VendorGroup.find_by(uid: params[:base_path])
    @file = @current_staff.shared_files.build(file_params.merge(vendor_group_id: vendor_group.id))
    if @file.save
      flash["success"] = t("shared_files.create.success")
      redirect_to files_path
    else
      flash.now["danger"] = t("shared_files.create.error")
      render :new
    end
  end

  def download
    download_file(uid: params[:uid], download_staff: @current_staff)
  end

  private
    def file_params
      params.require(:shared_file).permit(:file, :name, :description)
    end

    # rubocop:disable Metrics/AbcSize
    def download_file(uid:, download_staff:)
      shared_file = SharedFile.find_by!(uid: uid)

      # raise ArgumentError, 'This user does not have permission to download the file.' unless shared_file.downloadable?(@current_staff)

      if %w[development test].include? Rails.env
        send_data shared_file.file.read, filename: shared_file.file_name
      else
        s3 = Aws::S3::Client.new(
          region:            Rails.application.credentials.prd[:s3_region],
          access_key_id:     Rails.application.credentials.prd[:s3_access_key_id],
          secret_access_key: Rails.application.credentials.prd[:s3_secret_access_key]
        )
        options = {
          bucket: Rails.application.credentials.prd[:s3_bucket_name],
          key:    shared_file.file.current_path,
        }
        file = s3.get_object(options)

        send_data file.body.read, filename: shared_file.file_name, type: file.content_type
      end

      DownloadFileHistory.create!(shared_file: shared_file, staff: download_staff)
    end
  # rubocop:enable Metrics/AbcSize
end
