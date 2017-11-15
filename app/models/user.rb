class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   scope :role_wise_users, ->(role) { where(role: role) }


 def create_general_setting
    role = 'Student'
  end
end
