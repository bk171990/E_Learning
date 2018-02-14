class AddRefToExaminations < ActiveRecord::Migration[5.1]
  def change
    add_reference :examinations, :exam_question, foreign_key: true
  end
end
