ActionController::Routing::Routes.draw do |map|
  map.resources :juegos

  map.resources :temas, :has_many => :comentarios, :path_names => { :new => 'nueva', :edit => 'editar' }

  map.resources :estudiantes, :path_names => {:new =>"nuevo", :edit => "editar"}

    map.resources :mensajes, :path_names => {:new =>"nuevo", :edit => "editar"}
  
    map.login "login", :controller => "user_sessions", :action => "new"
    map.logout "logout", :controller => "user_sessions", :action => "destroy"
    map.registro "registro", :controller =>"users", :action=>"new"
    map.resources :grupos_estudiantiles, :path_names => { :new => 'nuevo', :edit => 'editar' }
    map.resources :universidades, :path_names => { :new => 'nueva', :edit => 'editar' }
    map.resources :actividades, :has_many => :comentarios, :path_names => { :new => 'nueva', :edit => 'editar' }
    map.resources :noticias, :has_many => :comentarios, :path_names => { :new => 'nueva', :edit => 'editar' }
    map.resources :user_sessions, :as =>"cuenta"
    map.resources :users, :as => 'usuarios', :path_names => {:new=>'nuevo', :edit => 'editar' }    
    map.register '/register/:activation_code', :controller => 'activations', :action => 'new'
    map.activate '/activate/:id', :controller => 'activations', :action => 'create'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "actividades"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
