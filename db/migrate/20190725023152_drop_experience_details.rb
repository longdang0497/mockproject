class DropExperienceDetails < ActiveRecord::Migration[5.2]
  def change
    drop_table :experience_details
    
    add_column :experiences, :title, :string
    add_column :experiences, :price_adult, :decimal
    add_column :experiences, :price_children, :decimal
    add_column :experiences, :price_infant, :decimal
    add_column :experiences, :duration, :string
    add_column :experiences, :age, :string
    add_column :experiences, :language, :string
    add_column :experiences, :short_description, :text
  end
end
