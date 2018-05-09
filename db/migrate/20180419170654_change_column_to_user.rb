class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :last_name, 		:string, null: true
  	change_column :users, :last_name_kana, 	:string, null: true
  	change_column :users, :first_name, 		:string, null: true
  	change_column :users, :first_name_kana, :string, null: true
  end
end
