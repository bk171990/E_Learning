class Payment < ApplicationRecord
  belongs_to :student, optional:true
  belongs_to :course, optional:true
  belongs_to :coupon, optional:true
  scope :shod, ->(id) { where(id: id).take }
  scope :list1, -> { where(payment_status: 'Offline') }
  scope :list2, ->  { where(payment_status: 'Online') }
end
