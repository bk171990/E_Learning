class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.references :coupon, foreign_key: true
      t.string :payment_status
      t.string :payment_type

      t.timestamps
    end
  end
end
