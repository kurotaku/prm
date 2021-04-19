class OfferDecorator < ApplicationDecorator
  delegate_all

  def display_progress
    product = object.product
    if product_label = product.product_labels.where(order: object.progress).last
      product_label.name
    else
      DefaultLabel.where(order: object.progress).last.name
    end
  end

end
