class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  has_many :payments
  belongs_to :user

  validates_presence_of :name, :phone, :address

  PAYMENT_STATUS =[
    ["Not paid!", :Not_Paid!],
    ["Paid!", :Paid]
  ]

  SHIPPING_STATUS =[
    ["Not shipped!", :Not_Shipped!],
    ["Shipped!", :Shipped]
  ]

end
