require 'rails_helper'

describe VendingMachine do

  it "500円でコーラを買う" do
    vm = VendingMachine.create(
      number_of_100_yen: 10,
      quantity_of_coke: 5
    )
    coke = vm.buy(500, Drink::COKE)
    expect(coke).to be_present

    charge = vm.refund
    expect(charge).to eq 400
  end


end