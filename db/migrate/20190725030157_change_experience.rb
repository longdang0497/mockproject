class ChangeExperience < ActiveRecord::Migration[5.2]
  def change
    change_table(:experience_dates) do |t|
      t.references :experience
      t.remove :experience_detail_id
    end
  end
end
