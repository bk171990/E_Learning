class CreateWeightages < ActiveRecord::Migration[5.1]
  def change
    create_table :weightages do |t|
      t.string :percentage
      t.references :examination, foreign_key: true

      t.timestamps
    end
  end
end
