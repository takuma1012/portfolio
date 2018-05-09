class AddTypeToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :type, :string, index: true
  end
end
