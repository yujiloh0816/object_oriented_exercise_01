class VendingMachine < ApplicationRecord
  attr_accessor :change

  has_many :stocks

  def buy(payment, kind_of_type)
    change = self.change = []
    coin = Coin.create(kind: payment)
    drink_type = DrinkType.create(kind: kind_of_type)

    # 100円と500円だけ受け付ける
    unless coin.one_hundred? || coin.five_hundred?
      change << coin
      return nil
    end

    if drink_type.coke? && stock_of_coke.quantity == 0
      change << coin
      return nil
    elsif drink_type.diet_coke? && stock_of_diet_coke.quantity == 0
      change << coin
      return nil
    elsif drink_type.tea? && stock_of_tea.quantity == 0
      change << coin
      return nil
    end

    # 釣り銭不足
    if coin.five_hundred? && number_of_100_yen.size < 4
      change << coin
      return nil
    end

    if coin.one_hundred?
      # 100円玉を釣り銭に使える
      number_of_100_yen << coin
    elsif coin.five_hundred?
      # 400円のお釣り
      change.concat(number_of_100_yen[0..3])
    end

    if drink_type.diet_coke?
      stock_of_coke.decrement(:quantity, 1)
    elsif drink_type.diet_coke?
      stock_of_diet_coke.decrement(:quantity, 1)
    elsif drink_type.tea?
      stock_of_tea.decrement(:quantity, 1)
    end

    self.save
    Drink.create(drink_type_id: drink_type)

  end

  def refund
    result = change.map(&:kind_before_type_cast).sum
    return result
  end

private

  def stock_of_coke
    Stock.create(
        vending_machine_id: self.id,
        quantity: 5
    )
  end

  def stock_of_diet_coke
    Stock.create(
      vending_machine_id: self.id,
      quantity: 5
    )
  end

  def stock_of_tea
    Stock.create(
      vending_machine_id: self.id,
      quantity: 5
    )
  end

  def number_of_100_yen
    result = []
    4.times { result << Coin.create(kind: :one_hundred) }
    return result
  end

end