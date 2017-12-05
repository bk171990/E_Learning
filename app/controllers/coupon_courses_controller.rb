class CouponCoursesController < ApplicationController
  before_action :set_coupon_course, only: [:show, :edit, :update, :destroy]

  # GET /coupon_courses
  # GET /coupon_courses.json
  def index
    @coupon_courses = CouponCourse.all
  end

  # GET /coupon_courses/1
  # GET /coupon_courses/1.json
  def show
  end

  # GET /coupon_courses/new
  def new
    @coupon_course = CouponCourse.new
  end

  # GET /coupon_courses/1/edit
  def edit
  end

  # POST /coupon_courses
  # POST /coupon_courses.json
  def create
    @coupon_course = CouponCourse.new(coupon_course_params)

    respond_to do |format|
      if @coupon_course.save
        format.html { redirect_to @coupon_course, notice: 'Coupon course was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_course }
      else
        format.html { render :new }
        format.json { render json: @coupon_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_courses/1
  # PATCH/PUT /coupon_courses/1.json
  def update
    respond_to do |format|
      if @coupon_course.update(coupon_course_params)
        format.html { redirect_to @coupon_course, notice: 'Coupon course was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon_course }
      else
        format.html { render :edit }
        format.json { render json: @coupon_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_courses/1
  # DELETE /coupon_courses/1.json
  def destroy
    @coupon_course.destroy
    respond_to do |format|
      format.html { redirect_to coupon_courses_url, notice: 'Coupon course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_course
      @coupon_course = CouponCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_course_params
      params.require(:coupon_course).permit(:coupon_id, :course_id, :coupon_course_category, :status)
    end
end
