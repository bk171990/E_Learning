class Admin < ApplicationRecord
  after_save :create_user_account

  def create_user_account
  	@user = User.create!(email: self.email, password: self.password)
  end
end
