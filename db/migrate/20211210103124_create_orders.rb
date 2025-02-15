class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.text :description
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :payment, null: true, foreign_key: true
      t.references :address, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
