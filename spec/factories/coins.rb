FactoryBot.define do
  factory :coin do

    trait :one_hundred_for_change_money do
      association :change_money
      kind { :one_hundred }
    end

    trait :one_hundred_for_cash_box do
      association :cash_box
      kind { :one_hundred }
    end

  end
end
