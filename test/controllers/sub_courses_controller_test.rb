require 'test_helper'

class SubCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_course = sub_courses(:one)
  end

  test "should get index" do
    get sub_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_course_url
    assert_response :success
  end

  test "should create sub_course" do
    assert_difference('SubCourse.count') do
      post sub_courses_url, params: { sub_course: { course_id: @sub_course.course_id, name: @sub_course.name } }
    end

    assert_redirected_to sub_course_url(SubCourse.last)
  end

  test "should show sub_course" do
    get sub_course_url(@sub_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_course_url(@sub_course)
    assert_response :success
  end

  test "should update sub_course" do
    patch sub_course_url(@sub_course), params: { sub_course: { course_id: @sub_course.course_id, name: @sub_course.name } }
    assert_redirected_to sub_course_url(@sub_course)
  end

  test "should destroy sub_course" do
    assert_difference('SubCourse.count', -1) do
      delete sub_course_url(@sub_course)
    end

    assert_redirected_to sub_courses_url
  end
end
