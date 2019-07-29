ActiveAdmin.register Location do 
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

  permit_params :province

  index do
    selectable_column
    column :id
    column :province
    actions
  end

  # filter :province, :as => :select, :collection => Location.all.collect {|loca| [loca.province] }

  form do |f|
    f.inputs do
      f.input :province
    end
    f.actions
  end
  
end
