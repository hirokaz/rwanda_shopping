FactoryBot.define do
    factory :category do
        trait :boy do
            name { "boy" }
          end
      
          trait :girl do
            name { "girl" }
          end
    end
  end