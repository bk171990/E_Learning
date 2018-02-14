class CreateExamAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :exam_answers do |t|
      t.string :description
      t.references :exam_question, foreign_key: true

      t.timestamps
    end
  end
end
