# frozen_string_literal: true

# orderモデル
class Order < ApplicationRecord
  belongs_to :cart, optional: true
  has_many :order_items
  has_many :items, through: :order_items
end
