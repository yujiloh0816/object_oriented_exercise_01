FactoryBot.define do
  factory :drink_stock do
    association :drink_storage

    trait :drink_coke do
      association :drink_type, :coke
    end

    trait :drink_diet_coke do
      association :drink_type, :diet_coke
    end

    trait :drink_tea do
      association :drink_type, :tea
    end

    trait :with_full do
      after(:build) do |drink_stock|
        drink_stock.drinks = []
        drink_stock.drinks << FactoryBot.build(:drink, drink_type: drink_stock.drink_type)
        drink_stock.drinks << FactoryBot.build(:drink, drink_type: drink_stock.drink_type)
        drink_stock.drinks << FactoryBot.build(:drink, drink_type: drink_stock.drink_type)
      end
    end

    trait :with_empty do
      after(:build) do |drink_stock|
        drink_stock.drinks = []
      end
    end

  end
end
