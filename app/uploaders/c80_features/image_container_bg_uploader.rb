# загрузка картинки для фона блока, в котором содержится контент виджета "преимущества"
module C80Features

  # грузит картинку слайдера
  class ImageContainerBgUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick

    storage :file

    process :resize_to_limit_my

    version :thumb_big do
      process :resize_to_big_by_width
    end

    version :thumb_preview do
      process :resize_to_preview
    end

    def store_dir
      'uploads/features/bg'
    end

    def filename
      if original_filename
        "image_#{secure_token(4)}.#{file.extension}"
      end
    end

    def resize_to_limit_my

      manipulate! do |img|

        # извлекаем ширину и подгоняем высоту
        w = C80Features::Prop.first.bg_image_limit_width
        h = C80Features::Prop.first.bg_image_limit_height

        # меняем размер
        img.resize "#{w}x#{h}<"
        img = yield(img) if block_given?
        img

      end
    end

    # меням размер оригинальной картинки, подгоняя её к требуемой ширине (высота рассчитается автоматом)
    def resize_to_big_by_width

      manipulate! do |img|

        # извлекаем ширину и подгоняем высоту
        w = C80Features::Prop.first.bg_big_width
        h = calc_height_of_image(w)

        # меняем размер
        img.resize "#{w}x#{h}<"
        img = yield(img) if block_given?
        img

      end

    end

    # пока используется только для показа картинки в админке
    def resize_to_preview
      manipulate! do |img|

        w = C80Features::Prop.first.bg_preview_width
        h = C80Features::Prop.first.bg_preview_height

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