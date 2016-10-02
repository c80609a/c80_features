ActiveAdmin.register C80Features::Para, :as => 'Para' do

  before_filter :skip_sidebar!, :only => :index

  menu :label => 'Преимущества'

  config.sort_order = 'id_asc'

  permit_params :title,
                :content,
                :image

  index do
    selectable_column
    column :image do |ab|
      image_tag("#{ab.image.thumb_preview.url}")
    end
    column :title
    column :content do |about|
      about.content.html_safe
    end
    actions
  end

  form(:html => {:multipart => true}) do |f|

    f.inputs 'Свойства' do
      f.input :image, :hint => image_tag("#{f.object.image}")
      f.input :title
      f.input :content, :as => :ckeditor
    end

    f.actions
  end

end