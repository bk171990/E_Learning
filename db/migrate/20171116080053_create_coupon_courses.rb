class CreateCouponCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :coupon_courses do |t|
      t.references :coupon, foreign_key: true
      t.references :course, foreign_key: true
      t.string :coupon_course_category
      t.string :status

      t.timestamps
    end
  end
end
