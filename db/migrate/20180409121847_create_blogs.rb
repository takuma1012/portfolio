class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.references 	:admin_id,   null: false, foreign_key: true
      t.string 		:title,	     null: false
      t.text 		:body,	     null: false
      t.datetime 	:created_at, null: false

      t.timestamps
    end
  end
end
