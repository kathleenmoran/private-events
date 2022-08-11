Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  root "events#index"
  resources :events, only: %i[new create index show edit update destroy delete]
  resources :event_attendees, only: %i[new create destroy delete]
  resources :users, only: [:show]
end
