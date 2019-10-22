class CoinMech < ApplicationRecord
  belongs_to :vending_machine
  has_one :payment
  has_one :cash_box

  def put(coin)
    create_payment(coin: coin)
  end

  def has_change_money?
    payment.need_change_money? && cash_box.has_change_money?
  end

  def commit
    payment.commit(cash_box)
  end

  def refund
    payment.refund
  end

end
