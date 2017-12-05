class CreateQuestionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_types do |t|
      t.string :ques_type

      t.timestamps
    end
  end
end
