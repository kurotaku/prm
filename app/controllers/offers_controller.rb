# frozen_string_literal: true

class OffersController < ApplicationController
  def index
    @offers = @current_vendor_group.offers.decorate
  end

  def show
    @offer = Offer.find_by(uid: params[:uid]).decorate
  end
end
