class AddColumnToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :about, :text
    add_column :admins, :social, :string
    add_column :admins, :work, :string
  end
end
