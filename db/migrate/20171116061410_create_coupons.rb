class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :coupon_name
      t.integer :discount
      t.string :coupon_description
      t.string :coupon_discount_code
      t.date :valid_from
      t.date :valid_until
      t.string :status


      t.timestamps
    end
  end
end
