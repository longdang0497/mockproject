class AddAdminUserToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_reference :experiences, :admin_user, index: true
  end
end
