class AddColumnToHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :status, :string
    add_column :histories, :pay_status, :string
  end
end
