FactoryBot.define do
  factory :vending_machine do
    trait :with_coin_mech_and_drink_storage do
      after(:create) do |vending_machine|
        vending_machine.create_coin_mech
        vending_machine.create_drink_storage
      end
    end
  end
end
