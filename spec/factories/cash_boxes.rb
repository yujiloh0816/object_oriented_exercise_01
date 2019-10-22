FactoryBot.define do
  factory :cash_box do
    association :coin_mech

    trait :enough_change do
      after(:build) do |cash_box|
        cash_box.coins = []
        4.times { cash_box.coins << FactoryBot.build(:coin, :one_hundred) }
      end
    end

    trait :out_of_change do
      after(:build) do |cash_box|
        cash_box.coins = []
      end
    end

  end
end
