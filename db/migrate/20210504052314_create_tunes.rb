class CreateTunes < ActiveRecord::Migration[6.0]
  def change
    create_table :tunes do |t|
      t.string :url, null: false
      t.string :name, null: false
      t.string :artist, null: false
      t.integer :genre_id, null: false
      t.text :text, null: false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
