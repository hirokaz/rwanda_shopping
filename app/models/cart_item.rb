# frozen_string_literal: true

# cart_itemモデル
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
end
