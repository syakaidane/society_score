class CreateCartScores < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_scores do |t|

      t.integer :score_id,          null: false, default: nil
      t.integer :customer_id,     null: false, default: nil
      t.timestamps
    end
  end
end
