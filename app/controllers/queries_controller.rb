class QueriesController < ApplicationController
	def index
		if current_user.role == 'Student'
			@queries = current_user.queries
		else
		  @queries = Query.all
	  end
	end


	def show
    	@query = Query.find(params[:id])
  end

	def new
  end

	def create
  	@query = Query.new(query_params)
  	@user = current_user
 		@query.save
 		@query.update(user_id: @user.id, student_id: @user.student.id)
		redirect_to @query
	end

	def update
 	    @query = Query.find(params[:id])
  		if @query.update(query_params)
    		redirect_to @query
  		else
    		render 'edit'
  		end
	end

	def destroy
    	@query = Query.find(params[:id])
    	@query.destroy
    	redirect_to queries_path
  end

	private

	def query_params
		params.require(:query).permit(:description)
	end
end
