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

  permit_params :title, :short_description, :content, :image, :admin_user_id, :location_id

  index do
    selectable_column
    column :id
    column :title 
    column :short_description
    column :content
    column "Location" do |i|
      i.location.province
    end
    column "Views", :impressions_count  
    column :image
    column "Created", :created_at
    column "Updated", :updated_at  
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :short_description
      row :content
      row "Location" do |i|
        i.location.province
      end
      row "Created by" do |i|
        i.admin_user.fullname
      end
      row "Admin user" do |i|
        i.admin_user.email
      end
      row :impressions_count
      row :image
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :id
  filter :title
  filter :short_description
  filter :content
  filter :location, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
  filter :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title 
      f.input :content,  :as => :ckeditor
      f.input :image, :as => :file 
      f.input :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
      f.input :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }
      # f.input :hashtag
    end
    f.actions
  end
end
