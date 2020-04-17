class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :purchase_status
      t.belongs_to :product
      t.belongs_to :user
      t.timestamps
    end
  end
end
