class AddImageToExperienceDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :experience_details, :image, :string
  end
end
