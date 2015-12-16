class CreateC80FeaturesParas < ActiveRecord::Migration
  def change
    create_table :c80_features_paras, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :title
      t.text :content
      t.string :image
    end
  end
end