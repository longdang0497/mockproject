ActiveAdmin.register Category do

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
  
  permit_params :category_name

  index do
    selectable_column
    id_column
    column :category_name
    actions
  end

  # filter :category_name, :as => :select, :collection => Category.all.collect {|ca| [ca.category_name] }

  form do |f|
    f.inputs do
      f.input :category_name
    end
    f.actions
  end
end
