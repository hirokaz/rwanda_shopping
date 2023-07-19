# frozen_string_literal: true

# order_itemモデル
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
end
