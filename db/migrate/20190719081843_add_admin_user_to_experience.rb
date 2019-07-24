class AddAdminUserToExperience < ActiveRecord::Migration[5.2]
  def change
    add_reference :experiences, :admin_user, foreign_key: true
  end
end
