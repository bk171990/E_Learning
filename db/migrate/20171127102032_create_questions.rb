class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :no_of_option
      t.integer :question_type_id

      t.timestamps
    end
  end
end
