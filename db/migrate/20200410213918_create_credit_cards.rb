class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :expiration
      t.string :cvv
      t.string :owner
      t.integer :user_id

      t.timestamps
    end
  end
end
