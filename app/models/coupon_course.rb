class CouponCourse < ApplicationRecord
  belongs_to :coupon
  belongs_to :course
end
