GoonerIn::Application.routes.draw do
  root :to => 'static_pages#index'
  match '/sign_up' => "users#new", as: :sign_up
  match '/log_in' => "sessions#new", as: :log_in
  match '/log_out' => "sessions#destroy", as: :log_out
  
  #auth login
  match '/auth/:provider/callback' => "sessions#auth"
  match '/auth/failure' => "sessions#failure"
  match '/user/edit' => "users#edit", as: :info_edit
  
  match "/people/:name" => "people#show", as: :person
  match "/people/:name/questions" => "people#questions_list", as: :person_questions
  match "/people/:name/questions/pages/:page" => "people#questions_list"
  match "/people/:name/answers" => "people#answers_list", as: :person_answers
  match "/people/:name/answers/pages/:page" => "people#answers_list"
  match "/people/:name/liked" => "people#liked_list", as: :person_liked
  match "/people/:name/liked/pages/:page" => "people#liked_list"
  
  resources :users, :only => [:create, :show]
  resources :sessions, :only => [:create]
  
  resources :players do
    member do
      get '/questions/pages/:page', :action => :show
    end
  end
  
  resources :answers, :only => [:like, :unlike, :index] do
    member do
      post :like
      delete :like, :action => :unlike
    end
  end
  
  resources :questions do
    resources :answers
    collection do
      get 'pages/:page', :action => :index
    end
    member do
      get 'pages/:page', :action => :show
    end
  end
  
  namespace :settings do
    resource :avatar
    resource :profile
    resource :password
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
