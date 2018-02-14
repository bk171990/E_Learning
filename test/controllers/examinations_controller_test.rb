require 'test_helper'

class ExaminationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @examination = examinations(:one)
  end

  test "should get index" do
    get examinations_url
    assert_response :success
  end

  test "should get new" do
    get new_examination_url
    assert_response :success
  end

  test "should create examination" do
    assert_difference('Examination.count') do
      post examinations_url, params: { examination: { description: @examination.description, exam_name: @examination.exam_name, exam_rules_and_regulations: @examination.exam_rules_and_regulations, mark_per_question: @examination.mark_per_question, publish_exam_time_and_date: @examination.publish_exam_time_and_date, time_for_question: @examination.time_for_question, total_marks_of_question: @examination.total_marks_of_question, total_no_of_question: @examination.total_no_of_question, total_time_for_exam: @examination.total_time_for_exam } }
    end

    assert_redirected_to examination_url(Examination.last)
  end

  test "should show examination" do
    get examination_url(@examination)
    assert_response :success
  end

  test "should get edit" do
    get edit_examination_url(@examination)
    assert_response :success
  end

  test "should update examination" do
    patch examination_url(@examination), params: { examination: { description: @examination.description, exam_name: @examination.exam_name, exam_rules_and_regulations: @examination.exam_rules_and_regulations, mark_per_question: @examination.mark_per_question, publish_exam_time_and_date: @examination.publish_exam_time_and_date, time_for_question: @examination.time_for_question, total_marks_of_question: @examination.total_marks_of_question, total_no_of_question: @examination.total_no_of_question, total_time_for_exam: @examination.total_time_for_exam } }
    assert_redirected_to examination_url(@examination)
  end

  test "should destroy examination" do
    assert_difference('Examination.count', -1) do
      delete examination_url(@examination)
    end

    assert_redirected_to examinations_url
  end
end
