class AddFieldsToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :remaining_fees, :string
    add_column :payments, :instalment_fees, :string
  end
end
