ActiveAdmin.register BlogDetail do

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
  permit_params :title, :content, :blog_id, :description, :image

  index do
    selectable_column
    column :id
    column :blog_id
    column :title
    column :description
    actions
  end
  show do
    attributes_table do
      row :blog_id
      row :title
      row :description
      row (:content) { |con| raw(con.content) }
      row :image do |i|
        image_tag url_for(i.image)
      end
    end
    active_admin_comments
  end

  filter :title, :as => :select, :collection => BlogDetail.all.collect {|blog| [blog.title] }

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :image, as: :file
      f.input :content,  :as => :ckeditor
    end
    f.actions
  end
end
