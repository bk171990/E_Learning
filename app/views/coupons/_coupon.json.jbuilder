json.extract! coupon, :id, :coupon_name, :discount, :coupon_description, :coupon_discount_code, :valid_from, :valid_until, :status, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
