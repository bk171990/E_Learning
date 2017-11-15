json.extract! admin, :id, :name, :email, :phonenumber, :password, :confirm_password, :created_at, :updated_at
json.url admin_url(admin, format: :json)
