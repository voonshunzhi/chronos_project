Rails.application.routes.draw do
    
  # namespace :admin do
  #     resources :patients
  #     resources :health_records
  #     resources :diabetes
  #     # resources :doctors
  #     resources :hypertensions
  #     resources :obeses
  #     # resources :users

  #     root to: "diabetes#index"
  #   end
  #Patient routes
  resources :users,only:[:index]
  resources :patients
  resources :doctors
  resources :prizes
  
  #Health records routes
  resources :health_records
  
  #Diseases resources
  resources :diabetes
  resources :hypertensions
  resources :obeses
  resources :badges
  #All these routes are by gem clearance
  constraints Clearance::Constraints::SignedIn.new do
      root to: 'pages#index', as: :signed_in_root 
  end
  constraints Clearance::Constraints::SignedOut.new do
      root to: "clearance/sessions#new"
  end
  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  

  get "sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "sign_up" => "users#new", as: "sign_up"
  get "superadmin" => "superadmins#index"
  get "admin/obeses" => "obeses#admin_index",as: "obeses_admin_index"
  get "admin/diabetes" => "diabetes#admin_index",as: "diabetes_admin_index"
  get "admin/hypertensions" => "hypertensions#admin_index",as: "hypertensions_admin_index"
  get "admin/all_users" => "superadmins#all_users"
  get "admin/all_active_patients" => "superadmins#all_active_patients"
  get "admin/all_points" => "superadmins#all_points"
  get "prizes/:id/deduct_point" => "prizes#deduct_point", as: "deduct_point"
end
