class CreateExperienceDates < ActiveRecord::Migration[5.2]
  def change
    create_table :experience_dates do |t|
      t.date :expFrom
      t.date :expTo
      t.integer :month
      t.integer :year
      t.references :experience_detail

      t.timestamps
    end
  end
end
