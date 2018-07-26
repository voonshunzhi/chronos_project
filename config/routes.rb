Rails.application.routes.draw do
    
  #Patient routes
  resources :patients
  
  #Health records routes
  resources :health_records
  
  #Diseases resources
  resources :diabetes
  resources :hypertensions
  resources :obeses
  
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
  
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  
  
  
end
