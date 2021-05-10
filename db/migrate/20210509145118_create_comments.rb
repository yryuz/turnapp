class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, foreign_key: true
      t.integer :tune_id, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
