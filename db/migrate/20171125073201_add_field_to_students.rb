class AddFieldToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :stud_no, :string
  end
end
