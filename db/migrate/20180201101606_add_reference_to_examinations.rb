class AddReferenceToExaminations < ActiveRecord::Migration[5.1]
  def change
    add_reference :examinations, :student_score, foreign_key: true
  end
end
