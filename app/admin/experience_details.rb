ActiveAdmin.register ExperienceDetail do

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
  permit_params :experience_id, :title, :description, :price_adult, :price_children, :price_infant, :duration, :age, :language

  index do
    selectable_column
    id_column
    column :title
    # column :description
    column :price_adult
    column :price_children
    column :price_infant
    column :duration
    column :age
    column :language
    column :experience_id
    actions
  end
  show do
    attributes_table do
      row :title
      row (:description) { |con| raw(con.description) }
      row :price_adult
      row :price_children
      row :price_infant
      row :duration
      row :age
      row :language
      row :experience_id
    end
    active_admin_comments
  end
  form do |f|
    f.inputs do
      f.input :experience, :as => :select, :collection => Experience.all.collect {|exp| [exp.id] }
      f.input :title
      f.input :description, :as => :ckeditor
      f.input :price_adult
      f.input :price_children
      f.input :price_infant
      f.input :duration
      f.input :age
      f.input :language
    end
    f.actions
  end
end
