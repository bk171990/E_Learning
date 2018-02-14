class AddQuestionTypeToExamQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :exam_questions, :question_type, :string
  end
end
