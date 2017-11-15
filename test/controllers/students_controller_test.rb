require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { address: @student.address, city: @student.city, conf_password: @student.conf_password, country: @student.country, coupon_code: @student.coupon_code, course: @student.course, dob: @student.dob, duration: @student.duration, email: @student.email, image: @student.image, landmark: @student.landmark, lastname: @student.lastname, middlename: @student.middlename, name: @student.name, password: @student.password, phone_number: @student.phone_number, pincode: @student.pincode, referral_code: @student.referral_code, state: @student.state } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { address: @student.address, city: @student.city, conf_password: @student.conf_password, country: @student.country, coupon_code: @student.coupon_code, course: @student.course, dob: @student.dob, duration: @student.duration, email: @student.email, image: @student.image, landmark: @student.landmark, lastname: @student.lastname, middlename: @student.middlename, name: @student.name, password: @student.password, phone_number: @student.phone_number, pincode: @student.pincode, referral_code: @student.referral_code, state: @student.state } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
