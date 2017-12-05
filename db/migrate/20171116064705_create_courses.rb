class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_description
      t.date :course_validity
      t.string :status
      t.string :batch
      t.date :admission_start_date
      t.date :admission_end_date

      t.timestamps
    end
  end
end
