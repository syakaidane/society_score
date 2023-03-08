class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|

      t.integer :genre_id,           null: false, default: ""
      t.string :score_name,          null: false, default: ""
      t.string :artist_name,         null: false, default: ""
      t.string :composer,            null: false, default: ""
      t.string :arranger,            null: false, default: ""
      t.string :grade,               null: false, default: ""
      t.string :score,               null: false, default: ""
      t.string :file_format,         null: false, default: ""
      t.integer :page,               null: false, default: ""
      t.text :score_caption,         null: false, default: ""
      t.integer :without_tax,        null: false, default: ""
      t.string :youtube_url,                      default: ""
      t.timestamps
    end
  end
end
