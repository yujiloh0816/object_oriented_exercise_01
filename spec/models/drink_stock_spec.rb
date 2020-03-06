require 'rails_helper'

describe DrinkStock do
  # it "ファクトリが生成されること" do
  #   drink_stock = FactoryBot.create(:drink_stock, :coke)
  #   expect(drink_stock).to be_valid
  # end

  it "コーラを1つもつstockを作成すること" do
    coke = FactoryBot.create(:drink_type, :coke)
    drink_stock = FactoryBot.create(:drink_stock, drink_type: coke)

    coke_stock = drink_stock.drinks
    expect(coke_stock.count).to eq 1
  end

end
