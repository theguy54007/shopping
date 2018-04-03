class Product < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name, :price,
  validates_presence_of :price

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items


end
