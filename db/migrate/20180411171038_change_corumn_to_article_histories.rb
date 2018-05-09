class ChangeCorumnToArticleHistories < ActiveRecord::Migration[5.1]
  def change
  	rename_column :article_histories, :article_id_id, :article_id
	rename_column :article_histories, :history_id_id, :history_id
	rename_column :blogs, :admin_id_id, :admin_id
	rename_column :interviews, :admin_id_id, :admin_id
	rename_column :offshots, :admin_id_id, :admin_id
	rename_column :tracks, :article_id_id, :article_id
  end
end
