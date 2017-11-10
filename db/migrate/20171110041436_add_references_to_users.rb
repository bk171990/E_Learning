class AddReferencesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :general_setting, foreign_key: true
    add_column :users, :role, :string
  end
end
