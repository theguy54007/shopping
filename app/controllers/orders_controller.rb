class OrdersController < ApplicationController

  def index
      @orders = Order.all
  end

  def create
    if current_user.nil?
      session[:form_data] = params[:order]
      redirect_to new_user_session_path
    else
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      @order.shipping_status = "Not shipped!"
      @order.payment_status = "Not Paid!"
      @order.sn = 1000 + Order.last.id
      @order.amount = 0
      @cart_items = current_cart.cart_items.all
      if @order.save
        @cart_items.each do |item|
          order_item = @order.order_items.build(product_id: item.product.id, price: item.product.price, quantity: item.quantity)
          @order.amount += item.product.price * item.quantity
          order_item.save!
        end
        @order.save!
        session[:cart_id] = nil
        redirect_to orders_path
      else
        render "carts/show.html.erb"
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
    flash[:alert] = "Your order was canceled!"
  end




  private

  def order_params
    params.require(:order).permit(:name, :phone, :address)
  end

end
