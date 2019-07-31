ActiveAdmin.register Booking do

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
  
  permit_params :first_choice, :second_choice, :third_choice, :first_starttime, :second_starttime, :third_starttime, :numAdults, :numInfants, :numChildren, :interpreter, :experience_id, :guest_firstnam, :guest_lastname, :guest_title, :age, :nationality, :language,
  :phone_number, :email, :address, :representative_firstname, :representative_lastname, :representative_title, :representative_email, :send_mail_only_representative, :total, :payment_type, :card_num, :card_firstname, :card_lastname, :card_exp_month, :card_exp_year,
  :security_code

  index do
    selectable_column
    id_column
    column :experiences do |exp|
      exp.experience.title
    end
    column :first_choice
    column :second_choice
    column :third_choice
    column :numAdults
    column :numChildren
    column :numInfants
    column :interpreter    
    column :send_mail_only_representative
    column :representative_firstname
    column :representative_email
    column :guest_firstnam
    column :email
    column :phone_number
    column :language
    column :nationality
    column :age
    column :language
    column "Location" do |i|
      i.experience.location.province
    end
    column :categories do |cata|
      cata.experience.categories.map { |cata| cata.category_name }.join(", ").html_safe
    end
    column :age
    column :experiences do |exp|
      exp.experience.duration
    end
    column :total
    column "Adult", :price_adult
    column "Children", :price_children
    column "Infant", :price_infant
    column "Card", :payment_type
    column "Num", :card_num
    column "Security Code", :security_code
    column "Exp Month", :card_exp_month
    column "Exp Year", :card_exp_year
    column "Card Owner", :card_firstname
    actions
  end

  show do
    attributes_table do
      row :id
      row "Experience" do |i|
        i.experience.title
      end
      row :first_choice
      row :second_choice
      row :third_choice
      row :first_starttime
      row :second_starttime
      row :third_starttime
      row :numAdults
      row :numChildren
      row :numInfants
      row :interpreter    
      row :send_mail_only_representative
      row :representative_title
      row :representative_firstname
      row :representative_lastname
      row :representative_email
      row :guest_title
      row :guest_firstnam
      row :guest_lastname
      row :email
      row :phone_number
      row :language
      row :nationality
      row :age
      row :address
      row "Location" do |i|
        i.experience.location.province
      end
      row :categories do |cata|
        cata.experience.categories.map { |cata| cata.category_name }.join(", ").html_safe
      end
      row "Duration", :experience do |i|
        i.experience.duration
      end
      row :total
      row :price_adult
      row :price_children
      row :price_infant
      row :payment_type
      row :card_num
      row :security_code
      row :card_exp_month
      row :card_exp_year
      row :card_firstname
      row :card_lastname
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # filter :title
  # filter :language
  # filter :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
  # filter :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }
  
  # form do |f|
  #   f.inputs do
  #     f.input :first_choice :as => :select, :collection => ExperienceDate.all.collect {|loca| [loca.expFrom, loca.id] }
  #     f.input :first_choice
  #     f.input :first_choice
  #     f.input :short_description, :input_html => { :maxlength => 140  }
  #     f.input :description
  #     f.input :location, :as => :select, :collection => Location.all.collect {|loca| [loca.province, loca.id] }
  #     f.has_many :category_experiences, allow_destroy: true do |n_f|
  #       n_f.input :category, :as => :select, :collection => Category.all.collect {|cata| [cata.category_name, cata.id] }
  #     end
  #     f.input :age
  #     f.input :duration
  #     f.input :language
  #     f.input :price_adult
  #     f.input :price_children
  #     f.input :price_infant
  #     f.input :image, as: :file
  #     f.input :admin_user, :as => :select, :collection => AdminUser.all.collect {|ad| [ad.fullname, ad.id] }
  #   end
  #   f.actions
  # end
end
