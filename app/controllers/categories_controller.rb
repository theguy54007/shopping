class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = @category.products.page(params[:page]).per(12)
    if params[:type] == "high"
    @products = @products.order(price: :desc) 
  elsif params[:type] == "low"
    @products = @products.order(price: :asc)
  elsif params[:type] == "old"
    @products = @products.order(created_at: :asc)
  elsif params[:type] == "new"
    @products = @products.order(created_at: :desc)
  elsif params[:type] == "random"
    @products
  end
    @items = current_cart.cart_items
  end

end
