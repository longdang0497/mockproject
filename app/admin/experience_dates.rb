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
  
  permit_params :expFrom, :expTo, :month, :year, :experience_id
  
  index do
    selectable_column
    id_column
    column "From", :expFrom
    column "To", :expTo
    column :month
    column :year
    column "Experience" do |i|
      i.experience.title
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :expFrom
      row :expTo
      row :month
      row :year
      row "Experience" do |i|
        i.experience.title
      end
    end
    active_admin_comments
  end

  filter :expFrom
  filter :expTo
  filter :month
  filter :year
  filter :experience, :as => :select, :collection => Experience.all.collect {|ad| [ad.title, ad.id] }
  
  form do |f|
    f.inputs do
      f.input :expFrom
      f.input :expTo
      f.input :month
      f.input :year
      f.input :experience, :as => :select, :collection => Experience.all.collect {|ad| [ad.title, ad.id] }
    end
    f.actions
  end
end
