class CreateMainPages < ActiveRecord::Migration[5.1]
  def change
    create_table :main_pages do |t|
      t.string :main_image_id

      t.timestamps
    end
  end
end
