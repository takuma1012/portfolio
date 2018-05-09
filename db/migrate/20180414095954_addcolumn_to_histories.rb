class AddcolumnToHistories < ActiveRecord::Migration[5.1]
  def change
  	add_column :histories, :payment, :string
  end
end
