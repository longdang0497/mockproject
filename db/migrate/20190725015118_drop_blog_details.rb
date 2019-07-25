class DropBlogDetails < ActiveRecord::Migration[5.2]
  def change
    drop_table :blog_details
    add_column :blogs, :title, :string
    add_column :blogs, :short_description, :text
    add_column :blogs, :content, :text
  end
end
