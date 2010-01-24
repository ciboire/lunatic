class ProductsController < ApplicationController
  #before_filter :authenticate, :only => [:index]
  

  # Main page
  def store
    session[:section] = 'store'
  end

  # Product details
  def show
    session[:section] = 'show'
    @product = Product.find(params[:id])
  end

  # List for editing (require authentication)
  def index
    session[:section] = 'index'
    @products = Product.find(:all, :order => 'category')
  end

  # New product (require authentication)
  def new
    session[:section] = 'new'
    @product = Product.new
  end

  # Edit product (require authentication)
  def edit
    session[:section] = 'edit'
    @product = Product.find(params[:id])
  end

  # Submit newly created product (require authentication)
  def create
    @product = Product.new(params[:product])
    if params[:alternate] != ''
      @product.category = params[:alternate]
    end

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to :action => "show", :id => @product.id
    else
      render :action => :new
    end
  end

  # Submit edited product (require authentication)
  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  # Delete product (require authentication)
  def destroy
    session[:section] = 'destroy'
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to :action => :edit
  end
end
