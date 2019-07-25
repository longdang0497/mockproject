ActiveAdmin.register Hashtag do

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
  
  permit_params :tag_name

  index do
    selectable_column
    id_column
    column :tag_name
    column :created_at
    actions
  end

  # filter :tag_name, :as => :select, :collection => Hashtag.all.collect {|tag| [tag.tag_name] }

  form do |f|
    f.inputs do
      f.input :tag_name
    end
    f.actions
  end
end
