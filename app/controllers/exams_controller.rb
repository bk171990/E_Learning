class ExamsController < ApplicationController

	def index
		@exams = Exam.all
	end

	def new
	  @exam = Exam.new
	  2.times do
	    question = @exam.questions.build
	    2.times { question.answers.build }
	  end
	end

	def create
		@exam = Exam.new(exam_params)
		@exam.save
		redirect_to @exam
	end

	def show
		@exam = Exam.find(params[:id])
	end

	def edit
		@exam = Exam.find(params[:id])
	end

	def update
		@exam = Exam.find(params[:id])
		@exam.update(exam_params)
		redirect_to @exam
	end

	private

	def exam_params
	params.require(:exam).permit(:name, questions_attributes: [:id, :content, :_destroy], answers_attributes: [:id, :question_id, :content])
end
end
