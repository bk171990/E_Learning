class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :option
      t.string :is_answer
      t.references :exam_questions, foreign_key: true

      t.timestamps
    end
  end
end
