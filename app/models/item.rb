class Item < ApplicationRecord
  belongs_to :category
  belongs_to :cart_items, optional: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  scope :price_asc, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }
  scope :new_item, -> { order(created_at: :desc) }
  has_many_attached :images
  enum status: {unreserved: 0, reserved: 1, sold: 2 }
  validates :images, attached: true, content_type: %w[image/png image/jpg image/jpeg], size: { less_than: 10.megabytes }
  end
