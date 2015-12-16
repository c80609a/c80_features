# загрузка иконок в блоки "о нас"
class C80Features::ParaUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/features"
  end

  def filename
    if original_filename
      "photo_#{model.id}.#{file.extension}"
    end
  end

  # TODO:: размеры картинок вынести в отдельную модель Props

  process :resize_to_limit => [121,107]

  version :thumb_fill do
    process :resize_to_fill => [121,107]
  end

  version :thumb_fit do
    process :resize_to_fit => [121,107]
  end

end
