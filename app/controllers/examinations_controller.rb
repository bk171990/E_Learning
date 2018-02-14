class ExaminationsController < ApplicationController
  before_action :set_examination, only: [:show, :edit, :update, :destroy]

  # GET /examinations
  # GET /examinations.json
  def index
    @examinations = Examination.paginate(:page => params[:page], :per_page => 10)
    @exam_questions = ExamQuestion.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /examinations/1P
  # GET /examinations/1.json
  def show
    @examination = Examination.find(params[:id])
    @exam_questions = @examination.exam_questions.build
    @exam_questions = @examination.exam_questions
  end

  def show_question
    @examination = Examination.find(params[:id])
  end

  # GET /examinations/new
  def new
    @examination = Examination.new
  end

  def question_paper
    @examination = Examination.find(params[:id])
  end

  def save_test
    @test = params[:exam_question]
    @examination = Examination.find(params[:examination_id])
    @student = Student.find(params[:student_id])
    @score = Examination.calculateres(@test, @examination.id, @student)
  end

  def disp_time
    @examination = Examination.find(params[:examination_id])
    @exam_questions = @examination.exam_questions
    @exam_answers = ExamAnswer.all
    @time = @examination.total_time_for_exam
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def select_question_type
    @options = params[:question_id] 
  end

  def option
    @option = params[:id].to_i
  end

  # GET /examinations/1/edit
  def edit
  end

  # POST /examinations
  # POST /examinations.json
  def create
    @examination = Examination.new(examination_params)
    respond_to do |format|
      if @examination.save
        Weightage.create(examination_id: @examination.id, percentage: '100')                   
        format.html { redirect_to @examination, notice: 'Examination was successfully created.' }
        format.json { render :show, status: :created, location: @examination }
      else
        format.html { render :new }
        format.json { render json: @examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examinations/1
  # PATCH/PUT /examinations/1.json
  def update
    respond_to do |format|
      if @examination.update(examination_params)
        format.html { redirect_to @examination, notice: 'Examination was successfully updated.' }
        format.json { render :show, status: :ok, location: @examination }
      else
        format.html { render :edit }
        format.json { render json: @examination.errors, status: :unprocessable_entity }
      end
    end
  end

  def start_test
  end

  # DELETE /examinations/1
  # DELETE /examinations/1.json
  def destroy
    @examination.destroy
    respond_to do |format|
      format.html { redirect_to examinations_url, notice: 'Examination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_examination
      @examination = Examination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def examination_params
      params.require(:examination).permit(:name, :exam_name, :description,\
       :time_for_question, :total_no_of_question,\
        :total_time_for_exam, :mark_per_question, :total_marks_of_question, \
        :publish_exam_time_and_date, :exam_rules_and_regulations, :exam_question)
    end
end
