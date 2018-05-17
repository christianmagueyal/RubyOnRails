Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # "root " lets you set the route of the site's root
  root 'posts#index', as: 'home'

  # Example of regular route: here the controller is pages_controller.rb 
  get 'about' => 'pages#about', as: 'about'

  #Example resource route (this maps HTTP verbs to controller actions)

  resources :posts do
  	resources :comments
  end



end
