class Course < ApplicationRecord
 has_many :coupons, dependent: :destroy
 has_many :payments
   scope :load, ->(id) { where(id: id).take }

 has_attached_file :photo, :styles => { :small => "800x540>" }

 validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
