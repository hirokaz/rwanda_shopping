class Order < ApplicationRecord
  belongs_to :cart,optional: true
end
