json.extract! student, :id, :name, :middlename, :lastname, :dob, :address, :landmark, :city, :state, :country, :pincode, :referral_code, :course, :duration, :phone_number, :image, :coupon_code, :email, :password, :conf_password, :created_at, :updated_at
json.url student_url(student, format: :json)
