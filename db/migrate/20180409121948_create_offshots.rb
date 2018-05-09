class CreateOffshots < ActiveRecord::Migration[5.1]
  def change
    create_table :offshots do |t|
      t.string 		:offshot_image_id,	null: false
      t.references 	:admin_id,			null: false, foreign_key: true

      t.timestamps
    end
  end
end
