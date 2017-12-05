class Course < ApplicationRecord
 has_many :coupons, dependent: :destroy
end
