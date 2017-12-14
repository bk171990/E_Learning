class AnswersController < ApplicationController
	  def create
    	@query = Query.find(params[:query_id])
    	@answer = @query.answers.create(answer_params)
    	redirect_to query_path(@query)
  	  end
 
  	private
    	def answer_params
      		params.require(:answer).permit(:body)
    	end
end
