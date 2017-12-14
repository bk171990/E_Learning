class AddFieldToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :instalment, :string
    add_column :payments, :remaining, :string
  end
end
