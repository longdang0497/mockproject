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
  
  # permit_params :category_name

  filter :location
  filter :admin_user_id

  form do |f|
    f.inputs do
      f.input :location_id
      f.input :admin_user_id
    end
    f.actions
  end
end
