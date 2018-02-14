class CreateStudentExams < ActiveRecord::Migration[5.1]
  def change
    create_table :student_exams do |t|
      t.references :examination, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
