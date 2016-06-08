module C80Features
  module ApplicationHelper

    def render_features_block_with_images2
      para_all = C80Features::Para.all
      render :partial => 'c80_features/features_block_with_images2',
             :locals => {
                 :para_all => para_all
             }
    end

    def render_features_block_with_images
      para_all = C80Features::Para.all
      render :partial => 'c80_features/features_block_with_images',
             :locals => {
                 :para_all => para_all
             }
    end

    def render_features_block
      para_all = C80Features::Para.all
      render :partial => 'c80_features/features_block',
             :locals => {
                 :para_all => para_all
             }
    end

  end
end