class CreateArticleHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_histories do |t|
      t.references 	:article_id, null: false, foreign_key: true
      t.references	:history_id, null: false, foreign_key: true
      t.integer 	:quantity,	 null: false, default: 1

      t.timestamps
    end
  end
end
