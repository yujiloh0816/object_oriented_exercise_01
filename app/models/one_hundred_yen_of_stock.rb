class OneHundredYenOfStock < ApplicationRecord
  belongs_to :vending_machine
  has_many :coins

  def does_not_have_money_change
    coins.size < 4
  end

  def add(coin)
    coin.update(one_hundred_yen_of_stock_id: self.id)
  end

  def take_out_change_money
    coins.limit(4).each { |coin| coin.update(change_money_id: self.id) }
  end

end