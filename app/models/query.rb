class Query < ApplicationRecord
	has_many :answers
	belongs_to :user, optional:true
	belongs_to :student , optional:true
end
