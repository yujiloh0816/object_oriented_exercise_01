FactoryBot.define do
  factory :drink_type do
    kind { :coke }
    trait :coke do
      kind { :coke }
    end

    trait :diet_coke do
      kind { :diet_coke }
    end

    trait :tea do
      kind { :tea }
    end

  end
end
