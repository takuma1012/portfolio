class RenameColumnToTrack < ActiveRecord::Migration[5.1]
  def change
    rename_column :tracks, :lyric, :lyricer
  end
end
