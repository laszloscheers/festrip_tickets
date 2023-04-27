class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.string :image_link
      t.string :description
      t.decimal :lat
      t.decimal :long
      t.string :youtube_video_path

      t.timestamps
    end
  end
end
