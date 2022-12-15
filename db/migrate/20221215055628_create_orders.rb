class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :total_payment
      t.integer :status
      t.integer :payment_method
      t.integer :shipping_cost

      t.timestamps
    end
  end
end
