Rails.application.routes.draw do
  devise_for :suppliers, :controllers => { :registrations => :registrations }
  devise_for :buyers, :controllers => { :registrations => :registrations }
  devise_for :admins, :controllers => { :registrations => :registrations }

  root to: "welcome#index"

  resources :buyers

  resources :suppliers, shallow: true do
    resources :services do
      resources :reviews
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :admins
  resources :suppliers
  resources :buyers
  
  get 'admins/pending/supplier' => 'admins#pending_supplier_signup', as: 'pending_supplier_signup_admin'
  put 'admins/:id/approve_supplier' => 'admins#approve_supplier_signup', as: 'approve_supplier_admin'
end
