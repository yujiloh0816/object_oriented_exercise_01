require 'rails_helper'

describe VendingMachine do

  it "ファクトリが生成されること" do
    # vm = FactoryBot.create(:vending_machine, :with_coin_mech_and_drink_storage)
    # expect(vm.coin_mech).to be_present
    # expect(vm.drink_storage).to be_present
    #
    # coin_mech = FactoryBot.create(:coin_mech)
    # expect(coin_mech).to be_present
    #
    # change_money = FactoryBot.create(:change_money)
    # expect(change_money).to be_present
    #
    # coin_for_change_money = FactoryBot.create(:coin, :one_hundred_for_change_money)
    # expect(coin_for_change_money).to be_present
    #
    # money_for_change_money = FactoryBot.create(:money, :one_hundred_for_change_money)
    # expect(money_for_change_money).to be_present
    #
    # cash_box = FactoryBot.create(:cash_box)
    # expect(cash_box).to be_present
    #
    # coin_for_cash_box = FactoryBot.create(:coin, :one_hundred_for_cash_box)
    # expect(coin_for_cash_box).to be_present
    #
    money_for_cash_box = FactoryBot.create(:money, :one_hundred_for_cash_box)
    expect(money_for_cash_box).to be_present
    expect(VendingMachine.count).to eq 1

    drink_stock = FactoryBot.create(:drink_stock, :coke )
    expect(drink_stock.quantity).to eq 5
    # 2つつくられてしまう・・・
    expect(VendingMachine.count).to eq 1

  end

  describe "自動販売機で商品を購入" do
    context "商品が購入できる場合" do
      it "100円でダイエットコーラを買う(おつり 0円)" do

      end

      it "500円でコーラを買う(おつり 400円)" do

      end
    end

    context "商品が購入できない場合" do
      it "100円と500円以外の硬貨を投入する" do

      end

      it "売り切れの商品を選択する" do

      end

      it "500円を投入し、400円のお釣りがない" do

      end

    end

  end

  # it "500円でコーラを買う" do
  #
  #   vm = VendingMachine.create
  #   vm.create_change_money
  #   one_hundred_yen_of_stock = vm.create_one_hundred_yen_of_stock
  #   4.times do
  #     one_hundred_yen_of_stock.coins.create(kind: "one_hundred")
  #   end
  #
  #   coke = vm.buy(500, Drink::COKE)
  #   expect(coke).to be_present
  #
  #   change = vm.refund
  #   expect(change).to eq "400"
  # end
  #
  # it "100円でダイエットコーラを買う" do
  #   vm = VendingMachine.create
  #   vm.create_change_money
  #   one_hundred_yen_of_stock = vm.create_one_hundred_yen_of_stock
  #   4.times do
  #     one_hundred_yen_of_stock.coins.create(kind: "one_hundred")
  #   end
  #   coke = vm.buy(100, Drink::DIET_COKE)
  #   expect(coke).to be_present
  #
  #   change = vm.refund
  #   expect(change).to eq "0"
  # end

end