class Product < ApplicationRecord
  mount_uploader :image, PhotoUploader
  validates_presence_of :name
  validates_presence_of :price

end
