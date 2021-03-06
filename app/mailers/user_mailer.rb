class UserMailer < ApplicationMailer
  default from: "My Cart <root@example.com>"

  def notify_order_create(order)
    @order = order
    @content = "Your order is created. Thank you!"

    mail to: order.user.email,
    subject: "ALPHA Camp | 訂單成立：#{@order.sn}"
  end

  def notify_order_paid(order)
    @order = order
    @content = "Your order has been paid. Thank you!"

    mail to: order.user.email,
    subject: "Order# #{@order.sn} has been paid!"
  end

  def notify_order_shipped(order)
    @order = order
    @content = "Your order has been shipped. Thank you!"

    mail to: order.user.email,
    subject: "Order# #{@order.sn} has been shipped!"
  end



end
