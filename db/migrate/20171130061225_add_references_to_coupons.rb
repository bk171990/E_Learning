class AddReferencesToCoupons < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :course, foreign_key: true
  end
end
