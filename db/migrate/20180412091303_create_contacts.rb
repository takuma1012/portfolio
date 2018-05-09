class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name,			null: false
      t.string :title,			null: false
      t.text :body,				null: false
      t.datetime :created_at

      t.timestamps
    end
  end
end
