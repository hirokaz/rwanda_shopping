# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_ids = [1, 2]
50.times do
  item = Item.new(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price(range: 1..1_000),
    category_id: category_ids.sample,
    quantity: Faker::Number.between(from: 1, to: 10),
    aasm_state: 'unreserved'
  )
  item.images.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'image.jpg')
  item.save!
end

# Admin.create!(
# password: "hogehoge111",
# )
