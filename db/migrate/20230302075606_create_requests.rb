class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|

      t.integer :customer_id,    null: false, default: ""
      t.timestamps
    end
  end
end
