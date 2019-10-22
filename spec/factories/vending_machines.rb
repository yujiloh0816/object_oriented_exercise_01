FactoryBot.define do
  factory :vending_machine do

    trait :fully_stocked do
      after(:build) do |vending_machine|
        vending_machine.drink_storage = FactoryBot.build(:drink_storage, :fully_stocked)
      end
    end

    trait :empty_stocked do
      after(:build) do |vending_machine|
        vending_machine.drink_storage = FactoryBot.build(:drink_storage, :empty_stocked)
      end
    end

    trait :enough_change do
      after(:build) do |vending_machine|
        vending_machine.coin_mech = FactoryBot.build(:coin_mech, :enough_change)
      end
    end

    trait :out_of_change do
      after(:build) do |vending_machine|
        vending_machine.coin_mech = FactoryBot.build(:coin_mech, :out_of_change)
      end
    end

  end
end
