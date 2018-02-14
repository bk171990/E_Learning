require 'test_helper'

class ExamQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exam_questions_index_url
    assert_response :success
  end

  test "should get new" do
    get exam_questions_new_url
    assert_response :success
  end

end
