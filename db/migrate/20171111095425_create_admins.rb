class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :phonenumber
      t.string :password
      t.string :confirm_password
      t.timestamps
    end
  end
end
