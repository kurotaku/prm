class OffersController < ApplicationController
  def index
    @offers = @current_maker_group.offers.decorate
  end

  def show
    @offer = Offer.find(params[:id]).decorate
  end
end
