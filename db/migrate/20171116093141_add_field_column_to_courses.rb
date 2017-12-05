class AddFieldColumnToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :fees, :string
  end
end
