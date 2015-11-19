class Category < ActiveRecord::Base
  has_many :products

  scope :deleted, -> { where(deleted: false) }
end
