class AddRelationsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :owner, :integer
  end
end
