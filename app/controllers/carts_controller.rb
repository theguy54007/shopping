class CartsController < ApplicationController

  def show
    @cart = current_cart
    @item = @cart.cart_items
  end

end
