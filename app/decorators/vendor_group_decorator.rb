class VendorGroupDecorator < ApplicationDecorator
  delegate_all

  def display_name
    object.name ? object.name : object.vendor_organization.name    
  end

end
