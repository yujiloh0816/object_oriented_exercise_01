class Payment < ApplicationRecord
  has_one :change_money
  has_one :coin

  def need_change_money?
    coin.five_hundred?
  end

  def commit(cash_box)
    cash_box.add(coin) if coin.one_hundred?
    change_money.add(cash_box.take_out_change_money) if coin.five_hundred?
  end

  def refund
    change_money.refund
  end

end
