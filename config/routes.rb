Rails.application.routes.draw do
	get "users/logout", as: "logout"
	get "users/login", as: "login"
	post "users/login_validation", as: "login_validation"

	resources :concerts
	resources :users
	resources :attendances

	root "concerts#index"
end
