class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :middlename
      t.string :lastname
      t.date :dob
      t.text :address
      t.text :landmark
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode
      t.string :referral_code
      t.string :course
      t.time :duration
      t.string :phone_number
      t.string :image
      t.string :coupon_code
      t.string :email
      t.string :password
      t.string :conf_password
      t.timestamps
    end
  end
end
