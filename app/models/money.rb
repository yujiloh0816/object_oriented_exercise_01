class Money < ApplicationRecord

  def add(money)
    update(amount: self.amount + money.amount)
  end

  def to_s
    amount.to_s
  end

end
