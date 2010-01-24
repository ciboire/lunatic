ActionController::Routing::Routes.draw do |map|
  
  map.home '', :controller => :products, :action => :store
  map.root :home

  map.connect 'faq', :controller => :products, :action => :faq
  map.connect 'products/:category', :controller => :products, :action => :store
  map.connect 'product/:id', :controller => :products, :action => :show
  
  map.connect 'penguin', :controller => :products,  :action => :index
  map.connect 'new', :controller => :products, :action => :new
  map.connect 'create', :controller => :products, :action => :create
  map.connect 'edit/:id', :controller => :products, :action => :edit
  map.connect 'update', :controller => :products, :action => :update
  map.connect 'destroy/:id', :controller => :products, :action => :destroy
  
  
  Clearance::Routes.draw(map)
  
end
