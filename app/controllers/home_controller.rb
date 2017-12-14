class HomeController < ApplicationController
	
	def index
    	@message = Home.new
  	end

  	def create
    	@message = Home.new(home_params)
    		if @message.valid?
    			@message.save
      			UserMailer.new_message(@message).deliver_now
      			flash.now[:notice] = "Your messages has been sent."
      		else
      	flash.now[:error] = "An error occurred while delivering this message."    
    	render :new
    	end
  	end


	def dashboard
    # if User.current.role == 'Student'
    #   render 'home/dash'
    # else
    #    home_index_path
    # end
	end


	def about
	end

	def courses
	end

	def our_team
	end

	def blog
	end
	
	def contact
    	@message = Home.new
    end

	def login
	end

	def register
	end

	def new
	end

	def course1
	end
	
  private

	def home_params
		params.require(:home).permit(:name, :email, :subject, :message)
end
end
