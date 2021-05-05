class StaticPagesController < ApplicationController
  def home
    redirect_to dashboards_path base_path: MakerGroup.all.first.uid
  end
end
