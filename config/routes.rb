Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :events
	resources :users
	resources :tickets
	resources :event_venues
end
