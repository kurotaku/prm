# frozen_string_literal: true

class VendorPage::DownloadHistoriesController < VendorPage::VendorPageController
  def index
    @histories = DownloadFileHistory.all.order(created_at: "DESC").page(params[:page]).per(10)
  end
end
