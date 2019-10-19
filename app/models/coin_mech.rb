class CoinMech < ApplicationRecord
  belongs_to :vending_machine
  has_one :change_money
  has_one :cash_box

  def add_change_money(coins)
    change_money.add(coins)
  end

  def add_coin_into_cash_box(coins)
    cash_box.add(coins)
  end

  def has_change?
    cash_box.has_change?
  end

  def take_out_change_money
    cash_box.take_out_change_money
  end

  def refund
    result = change_money.get_amount
    change_money.clear
    result
  end

end
