class Category < ApplicationRecord
  has_many :items #itemによって所有されているということを意味する
end
