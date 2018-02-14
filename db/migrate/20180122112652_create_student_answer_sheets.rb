class CreateStudentAnswerSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :student_answer_sheets do |t|

      t.references :student_exams, foreign_key: true
      t.references :options, foreign_key: true
      t.references :exam_questions, foreign_key: true

      t.timestamps
    end
  end
end
