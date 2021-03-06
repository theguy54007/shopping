class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.payment_status == "Paid"
        UserMailer.notify_order_paid(@order).deliver_now!
      end
      if @order.shipping_status == "Shipped"
        UserMailer.notify_order_shipped(@order).deliver_now!
      end
      redirect_to admin_orders_path
      flash[:notice] = "Order was updated!"
    else
      flash.now[:alert] = @order.errors.full_messages.to_sentence
      render "admin/orders/edit"
    end
  end


  private

  def order_params
    params.require(:order).permit(:payment_status, :shipping_status)
  end

end
