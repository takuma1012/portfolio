class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :article_name,     null: false
      t.integer :price,           null: false
      t.integer :stock,           null: false
      t.date :release_date,       null: false
      t.string :article_image_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
