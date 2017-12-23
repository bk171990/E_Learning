class AddColumnEmailToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :email, :string
  end
end
