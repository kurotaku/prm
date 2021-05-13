module DownloadFile
  extend ActiveSupport::Concern
  def download_file(uid:, download_user:)
    shared_file = SharedFile.find_by!(uid: uid)

    raise ArgumentError, 'This user does not have permission to download the file.' unless shared_file.downloadable?(current_user)

    if %w[development test].include? Rails.env
      send_data shared_file.file.read, filename: shared_file.file_name
    else
      s3 = Aws::S3::Client.new
      options = {
        bucket: Rails.application.credentials.prd[:s3_bucket_name],
        key:    shared_file.file.current_path,
      }
      file = s3.get_object(options)

      send_data file.body.read, filename: shared_file.file_name, type: file.content_type
    end

    DownloadFileHistory.create!(shared_file: shared_file, user: download_user)
  end
end