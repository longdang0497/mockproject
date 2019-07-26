ActiveAdmin.register Blog do

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

  permit_params :title, :image, :short_description, :content, :admin_user_id, :location_id,
  blog_hashtags_attributes: [:id, :blog_id, :hashtag_id, :_destroy],
  category_blogs_attributes: [:id, :blog_id, :category_id, :_destroy]

  index do
    selectable_column
    column :id
    column :title 
    column "Location" do |i|
      i.location.province
    end
    column :hashtags do |tag|
      tag.hashtags.map { |tag| tag.tag_name }.join(", ").html_safe
    end
    column :categories do |cata|
      cata.categories.map { |cata| cata.category_name }.join(", ").html_safe
    end
    column "Views", :impressions_count  
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row "Location" do |i|
        i.location.province
      end
      row "Created by" do |i|
        i.admin_user.fullname
      end
      row "Admin user" do |i|
        i.admin_user.email
      end
      row :hashtags do |tag|
        tag.hashtags.map { |tag| tag.tag_name }.join(", ").html_safe
      end
      row :categories do |cata|
        cata.categories.map { |cata| cata.category_name }.join(", ").html_safe
      end
      row :impressions_count
      row :image
      row :created_at
      row :updated_at
      row :short_description
      row :image do |i|
        image_tag url_for(i.image)
      end
      row (:content) { |con| raw(con.content) }
    end
    active_admin_comments
  end

  filter :title
  filter :location, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
  filter :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }

  form do |f|
    f.inputs do
      f.input :title 
      f.input :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
      f.input :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }
      f.has_many :blog_hashtags, allow_destroy: true do |n_f|
        n_f.input :hashtag, :as => :select, :collection => Hashtag.all.collect {|tag| [tag.tag_name, tag.id] }
      end
      f.has_many :category_blogs, allow_destroy: true do |n_f|
        n_f.input :category, :as => :select, :collection => Category.all.collect {|cata| [cata.category_name, cata.id] }
      end
      f.input :image, as: :file
      f.input :short_description
      f.input :content,  :as => :ckeditor
    end
    f.actions
  end
end
