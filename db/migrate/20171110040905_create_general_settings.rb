class CreateGeneralSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :general_settings do |t|
      t.string :name
      t.string :email
      t.string :phone
      
      t.timestamps
    end
  end
end
