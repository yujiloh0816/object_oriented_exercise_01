FactoryBot.define do
  factory :coin_mech do
    association :vending_machine

    trait :enough_change do
      after(:build) do |coin_mech|
        coin_mech.cash_box = FactoryBot.build(:cash_box, :enough_change)
      end
    end

    trait :out_of_change do
      after(:build) do |coin_mech|
        coin_mech.cash_box = FactoryBot.build(:cash_box, :out_of_change)
      end
    end

  end
end
