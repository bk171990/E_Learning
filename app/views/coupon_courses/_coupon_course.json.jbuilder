json.extract! coupon_course, :id, :coupon_id, :course_id, :coupon_course_category, :status, :created_at, :updated_at
json.url coupon_course_url(coupon_course, format: :json)
