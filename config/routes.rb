Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  
  #middleware for pages
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all 

  devise_for :admin_users, ActiveAdmin::Devise.config

  begin
    ActiveAdmin.routes(self)
  rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
  end
  
  resources :experience do
    member do
      get 'applicationform', to: "experience#application_form"
      get 'confirm', to: "experience#confirm"
      get 'sendrequest', to: "experience#send_request"
      get 'payment', to: "experience#payment"
      get 'complete', to: "experience#complete" 
    end
    
    collection do
      match 'search' => 'experience#search', :via => [:get, :post], :as => :search
    end
  end

  resources :blog do
    collection do
      match 'search' => 'blog#search', :via => [:get, :post], :as => :search
    end
  end
  root 'top#index', as: 'top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
