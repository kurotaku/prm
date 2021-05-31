class MakerGroupDecorator < ApplicationDecorator
  delegate_all

  def maker_name
    object.maker.name
  end
end
