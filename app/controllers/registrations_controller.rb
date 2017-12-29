class RegistrationsController < Devise::RegistrationsController

		def create
    		super
    		@user.create_general_setting
=begin        @student = Student.create!(name: @user.firstname, email: @user.email, password: @user.password, referenced_by: @user.referenced_by)@user.update(student_id: @student.id)
=end
  	end


  private

  	def sign_up_params
    	params.require(:user).permit!
  	end

  	def account_update_params
    	params.require(:user).permit!
  	end

end
