class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|

      t.integer :genre_id,          null: false, default: ""
      t.string :score_name,          null: false, default: ""
      t.text :score_caption,         null: false, default: ""
      t.integer :without_tax,       null: false, default: ""
      t.timestamps
    end
  end
end
