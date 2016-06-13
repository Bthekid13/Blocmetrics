Rails.application.routes.draw do

root to: "welcome#index"

get 'show' => 'users#show'


namespace :api, defaults: { format: :json } do
  match '/events', to: 'events#preflight', via: [:options]
  resources :events, only: [:create]
end

resources :registered_applications

devise_for :users, :controllers => { registrations: 'registrations' }



end
