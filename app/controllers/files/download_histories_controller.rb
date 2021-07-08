# frozen_string_literal: true

class Files::DownloadHistoriesController < ApplicationController
  before_action :set_file

  def index
    @histories = @file.download_file_histories.order(created_at: "DESC").page(params[:page]).per(10)
  end

  private
    def set_file
      @file = SharedFile.find_by(uid: params[:uid])
    end
end
