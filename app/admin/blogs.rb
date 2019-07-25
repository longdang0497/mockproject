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
  permit_params :admin_user_id, :location_id
  index do
    selectable_column
    column :id
    column "Location" do |i|
      i.location.province
    end
    column :impressions_count  
    column :created_at
    column :updated_at  
    actions
  end
  show do
    attributes_table do
      row "Location" do |i|
        i.location.province
      end
      row "Admin user" do |i|
        i.admin_user.email
      end
      row :impressions_count
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # filter :location, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
  # filter :admin_user, :collection => AdminUser.all.collect {|ad| [ad.email, ad.id] }

  form do |f|
    f.inputs do
      f.input :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
      f.input :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.email, ad.id] }
    end
    f.actions
  end
end
