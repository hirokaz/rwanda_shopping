# spec/factories/items.rb

FactoryBot.define do
    factory :item do
      name { "Sample Item" }
      description { "This is a sample item." }
      price { 100}
      category_id { [1, 2].sample }
      quantity { 10 }
      
      after(:build) do |item|
        item.images.attach(io: URI.open(Faker::LoremFlickr.image), filename: 'test_image.jpg', content_type: 'image/jpg')
        item.category = [FactoryBot.create(:category, :boy), FactoryBot.create(:category, :girl)].sample
      end
      
      trait :unreserved do
        aasm_state { "unreserved" }
      end
  
      trait :reserved do
        aasm_state { "reserved" }
      end
  
      trait :sold do
        aasm_state { "sold" }
      end
    end
  end
  