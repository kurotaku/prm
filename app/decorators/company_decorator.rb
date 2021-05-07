# frozen_string_literal: true

class CompanyDecorator < ApplicationDecorator
  delegate_all

  def thumbnail
    image? ? image.thumb.url : "company_default"
  end
end
