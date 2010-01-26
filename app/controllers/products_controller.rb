class ProductsController < ApplicationController
  #before_filter :authenticate, :only => [:index]
  before_filter "get_categories"
  before_filter "get_product_hot"


  # Main page
  def store
    session[:section] = 'store'
    @products = Product.paginate :page => params[:page], :per_page => 6, :order => 'title ASC',
      :conditions => {:category => session[:category]}
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
      flash[:success] = 'Product was successfully created.'
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  # Submit edited product (require authentication)
  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      flash[:success] = 'Product was successfully updated.'
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

    redirect_to :action => :index
  end
  
  
  private
  
  def get_categories
    @categories = Product.find(:all, :order => 'category ASC').map{|u| u.category}.uniq
    session[:category] = params[:category] ? params[:category] : 
        (@categories.include?(session[:category]) ? session[:category] : @categories[0])
  end
  
  def get_product_hot
    @products_hot = Product.find_all_by_is_hot(true)
    if @products_hot.size == 0
      @product_hot = Product.find(:first)
    else
      @product_hot = @products_hot[0]
    end
  end
end
