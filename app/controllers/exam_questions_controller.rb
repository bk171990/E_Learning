class ExamQuestionsController < ApplicationController
  
  def index
  	@exam_questions =ExamQuestion.all.paginate(page: params[:exam_question], per_page: 1)  
  end

  def show
    @exam_question = ExamQuestion.find(params[:id])
  end

  def edit
  end

  def new
    @examination = Examination.find(params[:format])
  	@exam_question = ExamQuestion.new
  end

  def create
    answer = params[:is_answer]
    @examination= Examination.find(params[:examination_id])
    @exam_question = @examination.exam_questions.create(allowed_params)
    ExamQuestion.create_que(params[:description][:option], @exam_question, answer)
    ExamAnswer.create(exam_question_id: @exam_question.id, description: params[:description][:option])
    redirect_to examination_path(@examination)

  end



  def update
  	@exam_question = ExamQuestion.find(params[:id])  
  		if @exam_question.update_attributes(allowed_params)
    	redirect_to @exam_question, notice: 'Successfully updated project'
  	  else
    	render :edit
  	  end
  end

private

	def allowed_params
		params.require(:exam_question).permit(:examination_id, :name, :question_type, tasks_attributes: [:id, :name, :_destroy, :description, :exam_question])
	end
end

  