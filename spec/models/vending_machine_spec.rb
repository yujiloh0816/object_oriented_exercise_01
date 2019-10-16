require 'rails_helper'

describe VendingMachine do

  it "500円でコーラを買う" do

    vm = VendingMachine.create
    vm.create_change_money
    one_hundred_yen_of_stock = vm.create_one_hundred_yen_of_stock
    4.times do
      one_hundred_yen_of_stock.coins.create(kind: "one_hundred")
    end

    coke = vm.buy(500, Drink::COKE)
    expect(coke).to be_present

    change = vm.refund
    expect(change).to eq "400"
  end

  it "100円でダイエットコーラを買う" do
    vm = VendingMachine.create
    vm.create_change_money
    one_hundred_yen_of_stock = vm.create_one_hundred_yen_of_stock
    4.times do
      one_hundred_yen_of_stock.coins.create(kind: "one_hundred")
    end
    coke = vm.buy(100, Drink::DIET_COKE)
    expect(coke).to be_present

    change = vm.refund
    expect(change).to eq "0"
  end

end