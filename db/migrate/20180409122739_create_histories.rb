class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.string :last_name,        null: false
      t.string :last_name_kana,   null: false
      t.string :first_name,       null: false
      t.string :first_name_kana,  null: false
      t.string :postal_code,      null: false
      t.string :prefecture,       null: false
      t.string :city,             null: false
      t.string :address,          null: false
      t.string :building
      t.string :phone,            null: false
      t.string :email,            null: false
      t.text :note
      t.datetime :created_at,     null: false

      t.timestamps
    end
  end
end
