class AddColumnToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :admin_referral_code, :string
  end
end
