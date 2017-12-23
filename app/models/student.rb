class Student < ApplicationRecord
	has_many :payments
	has_many :queries
	belongs_to :course, optional:true
    scope :load, ->(id) { where(id: id).take } #  	def self.set_referral_code
 #     self.name[0..2] += rand(0..10000).to_s

 # end
end
