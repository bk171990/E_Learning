class SubCoursesController < ApplicationController
  before_action :set_sub_course, only: [:show, :edit, :update, :destroy]

  # GET /sub_courses
  # GET /sub_courses.json
  def index
    @sub_courses = SubCourse.all
  end

  # GET /sub_courses/1
  # GET /sub_courses/1.json
  def show
  end

  # GET /sub_courses/new
  def new
    @sub_course = SubCourse.new
    @courses = Course.all
  end

  # GET /sub_courses/1/edit
  def edit
  end

  # POST /sub_courses
  # POST /sub_courses.json
  def create
    @sub_course = SubCourse.new(sub_course_params)

    respond_to do |format|
      if @sub_course.save
        format.html { redirect_to @sub_course, notice: 'Sub course was successfully created.' }
        format.json { render :show, status: :created, location: @sub_course }
      else
        format.html { render :new }
        format.json { render json: @sub_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_courses/1
  # PATCH/PUT /sub_courses/1.json
  def update
    respond_to do |format|
      if @sub_course.update(sub_course_params)
        format.html { redirect_to @sub_course, notice: 'Sub course was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_course }
      else
        format.html { render :edit }
        format.json { render json: @sub_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_courses/1
  # DELETE /sub_courses/1.json
  def destroy
    @sub_course.destroy
    respond_to do |format|
      format.html { redirect_to sub_courses_url, notice: 'Sub course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_course
      @sub_course = SubCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_course_params
      params.require(:sub_course).permit(:name, :course_id, :course_name)
    end
end
