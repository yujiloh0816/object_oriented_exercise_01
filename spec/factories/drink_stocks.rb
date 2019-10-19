FactoryBot.define do
  factory :drink_stock do
    association :drink_storage

    trait :coke do
      association :drink_type
      quantity { 5 }
    end

  end
end
