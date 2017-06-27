class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_type, null: false
      t.integer :album_id, null: false
      t.timestamps null: false
      t.text :lyric
    end
  end
end
