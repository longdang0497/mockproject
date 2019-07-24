ActiveAdmin.register BlogHashtag do

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
  permit_params :blog_id, :hashtag_id

  index do
    selectable_column
    column :id
    column "Blog" do |i|
      i.blog.blog_detail.title
    end
    column "Hashtag" do |i|
      i.hashtag.tag_name
    end
    actions
  end

  show do
    attributes_table do
      row "Blog" do |i|
        i.blog.blog_detail.title
      end
      row "Hashtag" do |i|
        i.hashtag.tag_name
      end
    end
    active_admin_comments
  end

  filter :blog
  filter :hashtag

  form do |f|
    f.inputs do
      f.input :blog, :as => :select, :collection => Blog.all.collect {|blog| [blog.blog_detail.title, blog.id] }
      f.input :hashtag, :as => :select, :collection => Hashtag.all.collect {|hashtag| [hashtag.tag_name, hashtag.id] }
    end
    f.actions
  end
  
end
