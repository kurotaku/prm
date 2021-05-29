# frozen_string_literal: true

class MakerPage::DownloadHistoriesController < MakerPage::MakerPageController
  def index
    @histories = DownloadFileHistory.all.order(created_at: "DESC").page(params[:page]).per(10)
  end
end
