class CartsController < ApplicationController

  def show
    @cart = current_cart
    @items = @cart.cart_items
    if session[:form_data].present?
      @order = Order.new(session[:form_data])
    else
      @order = Order.new
    end
  end

end
