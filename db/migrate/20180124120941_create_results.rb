class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :name
      t.float :percentage

      t.timestamps
    end
  end
end
