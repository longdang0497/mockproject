ActiveAdmin.register Experience do

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
    id_column
    column :location do |i|
      i.location.province
    end
    column :admin_user_id
    actions
  end

  show do
    attributes_table do
      row "Location" do |i|
        i.location.province
      end
      row :admin_user_id
      
    end
    active_admin_comments
  end

  # filter :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }

  form do |f|
    f.inputs do
      f.input :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
      f.input :admin_user_id, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.id] }
      
    end
    f.actions
  end
end
