Rails.application.routes.draw do
  devise_for :admins
  devise_for :leos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "signature_submissions#welcome"

  resources :signature_submissions do
    member do
      get :approve
      get :reject
    end
    collection do
      get :pending
      get :rejected
    end
  end
  resource :leo do
    collection do
      get :upload_voters
    end
  end
  resource :admin do
    collection do
      get :counties
      get :new_county
      get :new_user
    end
  end

end
