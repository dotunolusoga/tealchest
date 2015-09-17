class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :color, presence: true
  validates :price_cents, presence: true
  validates :amount_available, presence: true
  validates :image, presence: true

  validates_numericality_of :price_cents, :amount_available

end
