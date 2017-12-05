require 'test_helper'

class CouponCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coupon_course = coupon_courses(:one)
  end

  test "should get index" do
    get coupon_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_coupon_course_url
    assert_response :success
  end

  test "should create coupon_course" do
    assert_difference('CouponCourse.count') do
      post coupon_courses_url, params: { coupon_course: { coupon_course_category: @coupon_course.coupon_course_category, coupon_id: @coupon_course.coupon_id, course_id: @coupon_course.course_id, status: @coupon_course.status } }
    end

    assert_redirected_to coupon_course_url(CouponCourse.last)
  end

  test "should show coupon_course" do
    get coupon_course_url(@coupon_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_coupon_course_url(@coupon_course)
    assert_response :success
  end

  test "should update coupon_course" do
    patch coupon_course_url(@coupon_course), params: { coupon_course: { coupon_course_category: @coupon_course.coupon_course_category, coupon_id: @coupon_course.coupon_id, course_id: @coupon_course.course_id, status: @coupon_course.status } }
    assert_redirected_to coupon_course_url(@coupon_course)
  end

  test "should destroy coupon_course" do
    assert_difference('CouponCourse.count', -1) do
      delete coupon_course_url(@coupon_course)
    end

    assert_redirected_to coupon_courses_url
  end
end
