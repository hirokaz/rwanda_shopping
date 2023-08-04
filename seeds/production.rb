Admin.create!(
  email: "admin@gmail.com",
  password: "admin123",
)
category_ids = [1, 2]
10.times do
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
Category.create!(
    name: "boy"
)
Category.create!(
    name: "girl"
)


