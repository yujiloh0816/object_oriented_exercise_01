FactoryBot.define do
  factory :drink do

    trait :coke do
      association :drink_type, :coke
    end

    trait :diet_coke do
      association :drink_type, :diet_coke
    end

    trait :tea do
      association :drink_type, :tea
    end

  end
end
