# frozen_string_literal: true

# cartモデル
class Cart < ApplicationRecord
  has_many :cart_items
  has_many :orders
  has_many :items, through: :cart_items
end
