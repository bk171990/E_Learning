class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
