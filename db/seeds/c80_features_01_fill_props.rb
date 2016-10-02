# rake db:seed:c80_features_01_fill_props

C80Features::Prop.delete_all
C80Features::Prop.create!({
                              bg_image_limit_width:1600,
                              bg_image_limit_height:1600,
                              bg_big_width: 1600,
                              bg_preview_width: 400,
                              bg_preview_height: 280,
                              para_image_limit_width:300,
                              para_image_limit_height:300,
                              para_preview_width: 300,
                              para_preview_height: 300
                          })