module C80Features
  class Para < ActiveRecord::Base
    validates_with ParaValidator
    mount_uploader :image, ParaUploader
  end
end