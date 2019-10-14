require 'rails_helper'

describe VendingMachine do

  it "500円でコーラを買う" do
    vm = VendingMachine.create()
    coke = vm.buy(500, Drink::COKE)
    expect(coke).to be_present

    change = vm.refund
    expect(change).to eq 400
  end

  it "100円でダイエットコーラを買う" do
    vm = VendingMachine.create()
    coke = vm.buy(100, Drink::DIET_COKE)
    expect(coke).to be_present

    change = vm.refund
    expect(change).to eq 0
  end

end