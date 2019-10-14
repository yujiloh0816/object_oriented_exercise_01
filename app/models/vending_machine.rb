class VendingMachine < ApplicationRecord
  has_many :stocks
  has_one :one_hundred_yen_of_stock
  has_one :change_money

  def buy(payment, kind_of_type)
    coin = Coin.create(kind: payment)
    drink_type = DrinkType.create(kind: kind_of_type)

    # 100円と500円だけ受け付ける
    unless coin.one_hundred? || coin.five_hundred?
      coin.update(change_money_id: change_money.id)
      return nil
    end

    if drink_type.coke? && stock_of_coke.quantity == 0
      coin.update(change_money_id: change_money.id)
      return nil
    elsif drink_type.diet_coke? && stock_of_diet_coke.quantity == 0
      coin.update(change_money_id: change_money.id)
      return nil
    elsif drink_type.tea? && stock_of_tea.quantity == 0
      coin.update(change_money_id: change_money.id)
      return nil
    end

    # 釣り銭不足
    if coin.five_hundred? && one_hundred_yen_of_stock.coins.size < 4
      coin.update(change_money_id: change_money.id)
      return nil
    end

    if coin.one_hundred?
      # 100円玉を釣り銭に使える
      coin.update(one_hundred_yen_of_stock_id: one_hundred_yen_of_stock.id)
    elsif coin.five_hundred?
      # 400円のお釣り
      calculate_change
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
    result = change_money.get_amount
    change_money.clear
    result
  end

# private

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

  def calculate_change
    one_hundred_yen_of_stock.coins.limit(4).each { |coin| coin.update(change_money_id: change_money.id) }
  end

end