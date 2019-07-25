ActiveAdmin.register CategoryBlog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :blog_id, :category_id

  index do
    selectable_column
    id_column
    column "Category" do |i|
      i.category.category_name
    end
    column "Blog" do |i|
      i.blog.blog_detail.title
    end
    actions
  end

  show do
    attributes_table do
      row "Blog" do |i|
        i.blog.blog_detail.title
      end
      row "Category" do |i|
        i.category.category_name
      end
    end
    active_admin_comments
  end

  filter :blog, :collection => Blog.all.collect {|blog| [blog.blog_detail.title, blog.id] }
  filter :category, :collection => Category.all.collect {|category| [category.category_name, category.id] }

  form do |f|
    f.inputs do
      f.input :blog, :as => :select, :collection => Blog.all.collect {|blog| [blog.blog_detail.title, blog.id] }
      f.input :category, :as => :select, :collection => Category.all.collect {|category| [category.category_name, category.id] }
    end
    f.actions
  end
end
