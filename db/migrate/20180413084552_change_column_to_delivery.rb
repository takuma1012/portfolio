class ChangeColumnToDelivery < ActiveRecord::Migration[5.1]
  def change
  	change_column :deliveries, :prefecture, :string
  end
end
