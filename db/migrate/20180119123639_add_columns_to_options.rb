class AddColumnsToOptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :options, :exam_question, foreign_key: true
  end
end
