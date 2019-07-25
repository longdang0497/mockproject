ActiveAdmin.register AdminUser do
  permit_params :email, :fullname, :avatar, :bio, :role_id
  
  index do
    selectable_column
    id_column
    column :email
    column :fullname
    column :role
    column :avatar
    column :bio
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :role, :collection => Role.all.collect {|role| [role.name, role.id] }

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, :as => :select, :collection => Role.all.collect {|role| [role.name, role.id] }
    end
    f.actions
  end

end
