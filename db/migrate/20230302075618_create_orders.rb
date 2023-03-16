class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id,    null: false, default: nil
      t.integer :total,           null: false, default: nil
      t.integer :payment_method,  null: false, default: "0"
      t.timestamps
    end
  end
end
