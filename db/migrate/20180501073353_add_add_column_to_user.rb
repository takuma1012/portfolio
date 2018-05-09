class AddAddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mail_flg, :boolean, null: true, default: false, index: true
  end
end
