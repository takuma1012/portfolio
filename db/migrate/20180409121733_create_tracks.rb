class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.references :article_id, null: false, foreign_key: true
      t.string    :track_name, null: false
      t.integer   :track_num,  null: false
      t.string    :lyric
      t.string    :composer,   null: false

      t.timestamps
    end
  end
end
