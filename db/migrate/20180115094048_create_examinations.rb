class CreateExaminations < ActiveRecord::Migration[5.1]
  def change
    create_table :examinations do |t|
      t.string :exam_name
      t.string :description
      t.time :time_for_question
      t.string :total_no_of_question
      t.string :total_time_for_exam
      t.string :mark_per_question
      t.string :total_marks_of_question
      t.string :publish_exam_time_and_date
      t.string :exam_rules_and_regulations

      t.timestamps
    end
  end
end
