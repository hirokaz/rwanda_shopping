# frozen_string_literal: true

# itemモデル
class Item < ApplicationRecord
  include AASM
  aasm do
    state :unreserved, initial: true
    state :reserved
    state :sold

    event :reserve do
      transitions from: :unreserved, to: :reserved
    end

    event :cancel do
      transitions from: :reserved, to: :unreserved
    end

    event :soldout do
      transitions from: :reserved, to: :sold
    end
  end
  belongs_to :category
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A\d+(\.\d{1,2})?\z/ }
  scope :price_asc, -> { order(price: :asc) }
  scope :price_desc, -> { order(price: :desc) }
  scope :new_item, -> { order(created_at: :desc) }
  has_many_attached :images
  validates :images, attached: true, content_type: %w[image/png image/jpg image/jpeg], size: { less_than: 10.megabytes }
end
