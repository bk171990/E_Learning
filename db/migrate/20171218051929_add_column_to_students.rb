class AddColumnToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :txnid, :string
    add_column :students, :amount, :string
    add_column :students, :payment_status, :string
    add_column :students, :access_token, :string
  end
end
