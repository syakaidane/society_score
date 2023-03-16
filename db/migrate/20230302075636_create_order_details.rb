class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :order_id,           null: false, default: nil
      t.integer :score_id,            null: false, default: nil
      t.integer :price,              null: false, default: nil
      t.timestamps
    end
  end
end
