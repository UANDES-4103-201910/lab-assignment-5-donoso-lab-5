Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :events
	resources :orders
	resources :event_venues
	resources :ticket_zones
	resources :users
	resources :tickets do
		resources :ticket_types
	end
	resources :event_venues
end
