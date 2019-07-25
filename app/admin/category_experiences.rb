ActiveAdmin.register CategoryExperience do

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
  permit_params :experience_id, :category_id, :experience

  index do
    selectable_column
    id_column
    column "Experience" do |i|
      i.experience.experience_detail.title
    end
    column "Category" do |i|
      i.category.category_name
    end
    actions
  end

  show do
    attributes_table do
      row "Experience" do |i|
        i.experience.experience_detail.title
      end
      row "Category" do |i|
        i.category.category_name
      end
    end
    active_admin_comments
  end

  filter :experience, :as => :select, :collection => ExperienceDetail.all.collect {|loca| [loca.title, loca.id] }
  filter :category, :collection => Category.all.collect {|category| [category.category_name, category.id] }

  form do |f|
    f.inputs do
      f.input :experience, :as => :select, :collection => Experience.all.collect {|experience| [experience.id] }
      f.input :category, :as => :select, :collection => Category.all.collect {|category| [ category.id] }
    end
    f.actions
  end
end
