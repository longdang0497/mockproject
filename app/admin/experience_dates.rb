ActiveAdmin.register ExperienceDate do

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
  
  permit_params :expFrom, :expTo, :month, :year, :experience_detail_id
  
  index do
    selectable_column
    id_column
    column "From", :expFrom
    column "To", :expTo
    column :month
    column :year
    column :experience_detail_id
    actions
  end

  filter :expFrom
  filter :expTo
  filter :month
  filter :year
  filter :experience_detail_id
  
  form do |f|
    f.inputs do
      f.input :expFrom
      f.input :expTo
      f.input :month
      f.input :year
      f.input :experience_detail_id
    end
    f.actions
  end
end
