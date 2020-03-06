FactoryBot.define do
  factory :money do

    trait :one_hundred_for_change_money do
      association :coin, :one_hundred_for_change_money
      amount { coin.amount }
    end

    trait :one_hundred_for_cash_box do
      association :coin, :one_hundred_for_cash_box
      amount { coin.amount }
    end

  end
end
