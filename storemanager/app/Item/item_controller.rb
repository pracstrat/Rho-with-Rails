require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ItemController < Rho::RhoController
  include BrowserHelper

  # GET /Item
  def index
    @items = Item.find(:all)
    render :back => '/app'
  end

  def view
    @items = Item.find(
      :all, 
      :conditions => {:product_id => @params['product_id']}, 
      :select => ['name','product_id'] 
    )
    render :action=>:index, :back => '/app'
  end

  # GET /Item/{1}
  def show
    @item = Item.find(@params['id'])
    if @item
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Item/new
  def new
    @item = Item.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Item/{1}/edit
  def edit
    @item = Item.find(@params['id'])
    if @item
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Item/create
  def create
    @item = Item.create(@params['item'])
    redirect :action => :index
  end

  # POST /Item/{1}/update
  def update
    @item = Item.find(@params['id'])
    @item.update_attributes(@params['item']) if @item
    redirect :action => :index
  end

  # POST /Item/{1}/delete
  def delete
    @item = Item.find(@params['id'])
    @item.destroy if @item
    redirect :action => :index  
  end
end
