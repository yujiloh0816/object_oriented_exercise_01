FactoryBot.define do
  factory :drink_storage do
    association :vending_machine

    trait :fully_stocked do
      after(:build) do |drink_storage|
        drink_storage.drink_stocks = []
        drink_storage.drink_stocks << FactoryBot.build(:drink_stock, :drink_coke, :with_full)
        drink_storage.drink_stocks << FactoryBot.build(:drink_stock, :drink_diet_coke, :with_full)
        drink_storage.drink_stocks << FactoryBot.build(:drink_stock, :drink_tea, :with_full)
      end
    end

    trait :empty_stocked do
      after(:build) do |drink_storage|
        drink_storage.drink_stocks = []
        drink_storage.drink_stocks << FactoryBot.build(:drink_stock, :drink_coke, :with_empty)
        drink_storage.drink_stocks << FactoryBot.build(:drink_stock, :drink_diet_coke, :with_empty)
        drink_storage.drink_stocks << FactoryBot.build(:drink_stock, :drink_tea, :with_empty)
      end
    end

  end
end
