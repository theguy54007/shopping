class CartsController < ApplicationController

  def show
    @cart = current_cart
    @items = @cart.cart_items
  end

end
