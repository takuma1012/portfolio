class ChangeColumnToHistory < ActiveRecord::Migration[5.1]
  def change
  	change_column :histories, :status, :string, :default => '未配送'
  end
end
