class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :users
      t.string :zip_code
      t.string :complement

      t.timestamps
    end
  end
end
