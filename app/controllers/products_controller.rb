class ProductsController < ApplicationController

def index
  @products = Product.page(params[:page]).per(10)
  if params[:type] == "high"
    @products = Product.page(params[:page]).per(10).order(price: :desc) 
  elsif params[:type] == "low"
    @products = Product.page(params[:page]).per(10).order(price: :asc)
  elsif params[:type] == "old"
    @products = Product.page(params[:page]).per(10).order(created_at: :asc)
  elsif params[:type] == "new"
    @products = Product.page(params[:page]).per(10).order(created_at: :desc)
  elsif params[:type] == "random"
    @products = Product.page(params[:page]).per(10)
  end
  @items = current_cart.cart_items
  @categories = Category.all
end

def show
  @product = Product.find(params[:id])
  @comment = Comment.new
  @items = current_cart.cart_items
end

def add_to_cart
  @product = Product.find(params[:id])
  current_cart.add_cart_item(@product)

  #redirect_to root_path
end

def remove_from_cart
  @product = Product.find(params[:id])
  cart_item = current_cart.cart_items.find_by(product_id: @product)
  cart_item.destroy

  #redirect_back(fallback_location: root_path)
end

def adjust_item
  @product = Product.find(params[:id])
  cart_item = current_cart.cart_items.find_by(product_id: @product)

  if params[:type] == "add"
    cart_item.quantity += 1
  elsif params[:type] == "subtract"
    cart_item.quantity -= 1
  end

  if cart_item.quantity == 0
    cart_item.destroy
  else
    cart_item.save
  end

  #redirect_back(fallback_location: root_path)

end




end
