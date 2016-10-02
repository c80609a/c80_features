class CreateC80FeaturesProps < ActiveRecord::Migration
  def change
    create_table :c80_features_props, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.integer :bg_image_limit_width
      t.integer :bg_image_limit_height
      t.integer :bg_big_width
      t.integer :bg_preview_width
      t.integer :bg_preview_height
      t.integer :para_image_limit_width
      t.integer :para_image_limit_height
      t.integer :para_preview_width
      t.integer :para_preview_height
      t.string :image_container_bg
    end
  end
end