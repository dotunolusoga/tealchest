class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  scope :deleted, -> { where(deleted: false) }

  validates :name, presence: true
  validates :description, presence: true
  validates :color, presence: true
  validates :price_cents, presence: true
  validates :amount_available, presence: true
  # validates :image, presence: true

  validates_numericality_of :price_cents, :amount_available

  belongs_to :category
  has_many :order_items, dependent: :destroy

end
