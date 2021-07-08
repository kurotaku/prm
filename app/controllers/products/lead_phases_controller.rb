# frozen_string_literal: true

class Products::LeadPhasesController < ApplicationController
  before_action :set_product, only: %i[index]

  def index
    @lead_phases = @current_vendor_group.lead_phases.order(position: "ASC")
  end

  private
    def set_product
      @product = Product.find_by(uid: params[:uid]).decorate
    end
end
