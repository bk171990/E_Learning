class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   scope :role_wise_users, ->(role) { where(role: role) }
   validates :phone_no, numericality: { only_integer: true }, length: \
  { minimum: 10, maximum: 10 }, allow_blank: true
  scope :shod, ->(id) { where(id: id).take }


 def create_general_setting
    role = 'Student'
    role = 'SuperAdmin' if id == 1
    gs = GeneralSetting.create(name: 'Portal ')
    update(general_setting_id: gs.id, role: role)
  end

 def self.current
    Thread.current[:user]
  end

  # setter for current user
  def self.current=(user)
    Thread.current[:user] = user
  end
end
