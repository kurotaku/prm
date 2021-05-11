class FileUploader < BaseUploader
  include ActionView::Helpers::NumberHelper

  process :store_file_attributes

  private

  def store_file_attributes
    return unless file && model.instance_of?(SharedFile)

    model.file_name  = File.basename(file.file)
    model.file_size  = File.size(file.file)
    model.human_size = number_to_human_size(model.file_size)
  end
end
