class AddPriceToHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :price, :integer
  end
end
