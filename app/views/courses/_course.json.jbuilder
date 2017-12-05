json.extract! course, :id, :course_name, :course_description, :course_validity, :status, :batch, :admission_start_date, :admission_end_date, :coupon_id, :created_at, :updated_at
json.url course_url(course, format: :json)
