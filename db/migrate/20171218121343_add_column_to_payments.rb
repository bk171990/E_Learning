class AddColumnToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :txnid, :string
    add_column :payments, :amount, :string
    add_column :payments, :status, :string
    add_column :payments, :access_token, :string
  end
end
