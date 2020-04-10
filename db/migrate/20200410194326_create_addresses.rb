class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :complement
      t.integer :user_id

      t.timestamps
    end
  end
end
