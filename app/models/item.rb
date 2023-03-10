class Item < ApplicationRecord
  belongs_to :category
  belongs_to :cart_items, optional: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  has_many_attached :images
end
