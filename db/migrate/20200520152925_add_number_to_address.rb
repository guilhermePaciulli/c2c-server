class AddNumberToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :number, :string
  end
end
