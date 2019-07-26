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
  
  permit_params :title, :short_description, :description, :age, :language, :duration, :price_adult, :price_children, :price_infant, :location_id, :admin_user_id,
  category_experiences_attributes: [:id, :experience_id, :category_id, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column "Location" do |i|
      i.location.province
    end
    column :categories do |cata|
      cata.categories.map { |cata| cata.category_name }.join(", ").html_safe
    end
    column :age
    column :duration
    column :language
    column "Adult", :price_adult
    column "Children", :price_children
    column "Infant", :price_infant
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :short_description
      row :description
      row "Location" do |i|
        i.location.province
      end
      row :categories do |cata|
        cata.categories.map { |cata| cata.category_name }.join(", ").html_safe
      end
      row :age
      row :duration
      row :language
      row :price_adult
      row :price_children
      row :price_infant
      row :image
      row "Created by" do |i|
        i.admin_user.fullname
      end
      row "Admin user" do |i|
        i.admin_user.email
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :title
  filter :language
  filter :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
  filter :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :short_description, :input_html => { :maxlength => 140  }
      f.input :description
      f.input :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
      f.has_many :category_experiences, allow_destroy: true do |n_f|
        n_f.input :category, :as => :select, :collection => Category.all.collect {|cata| [cata.category_name, cata.id] }
      end
      f.input :age
      f.input :duration
      f.input :language
      f.input :price_adult
      f.input :price_children
      f.input :price_infant
      f.input :image, as: :file
      f.input :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }
    end
    f.actions
  end
end
