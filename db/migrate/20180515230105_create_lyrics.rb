class CreateLyrics < ActiveRecord::Migration[5.1]
  def change
    create_table :lyrics do |t|
    	t.references :article, 	null: false, foreign_key: true
    	t.references :track, 	null: false, foreign_key: true
    	t.references :admin, 	null: false, foreign_key: true
    	t.text :lyric,       	null: false

      t.timestamps
    end
  end
end
