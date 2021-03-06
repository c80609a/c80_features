# загрузка иконок в блоки "о нас"

module C80Features

  # грузит картинку слайдера
  class ParaUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick

    storage :file

    process :resize_to_limit_my

    version :thumb_preview do
      process :resize_to_preview
    end

    def store_dir
      'uploads/features'
    end

    def filename
      if original_filename
        "image_#{secure_token(4)}.#{file.extension}"
      end
    end

    def resize_to_limit_my

      manipulate! do |img|

        # извлекаем ширину и подгоняем высоту
        w = C80Features::Prop.first.para_image_limit_width
        h = C80Features::Prop.first.para_image_limit_height

        # меняем размер
        img.resize "#{w}x#{h}<"
        img = yield(img) if block_given?
        img

      end
    end

    # пока используется только для показа картинки в админке
    def resize_to_preview
      manipulate! do |img|

        w = C80Features::Prop.first.para_preview_width
        h = C80Features::Prop.first.para_preview_height

        img.resize "#{w}x#{h}>"
        img = yield(img) if block_given?
        img

      end
    end

    protected

    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end

    private

    # рассчитаем высоту картинки, которая получится, когда подгоняем картинку по ширине w
    def calc_height_of_image(w)
      model_image = ::MiniMagick::Image.open(model.image.current_path)
      calc_height(w, model_image["width"], model_image["height"])
    end

    # подгоняем по ширине, рассчитываем высоту
    def calc_height(width, original_w, original_h)
      k = width.to_f/original_w
      original_h * k
    end

  end

end