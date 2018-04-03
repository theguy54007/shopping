class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy

  belongs_to :user

  validates_presence_of :name, :phone, :address 

end
