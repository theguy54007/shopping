class Product < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name
  validates_presence_of :price

  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

end
