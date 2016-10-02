module C80Features
  class Prop < ActiveRecord::Base
    mount_uploader :image_container_bg, ImageContainerBgUploader
  end
end