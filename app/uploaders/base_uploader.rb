# frozen_string_literal: true

class BaseUploader < CarrierWave::Uploader::Base
  # Choose what kind of storage to use for this uploader:
  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.uid}"
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w[txt csv xls xlsx doc docx gif jpg jpeg png bmp svg pdf ppt pptx]
  end

  def size_range
    1..100.megabytes
  end
end
