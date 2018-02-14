class AddReferenceToQuestionTypes < ActiveRecord::Migration[5.1]
  def change
    add_reference :question_types, :weightage, foreign_key: true
  end
end
