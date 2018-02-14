class AddExaminationRefToExamQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :exam_questions, :examination, foreign_key: true
  end
end
