class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :cart

  def item_total
    self.quantity * self.product.price
  end

end
