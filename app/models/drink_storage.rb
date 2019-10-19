class DrinkStorage < ApplicationRecord
  belongs_to :vending_machine
  has_many :drink_stocks

  def is_empty(drink_type)
    drink_stocks.get(drink_type).blank?
  end

  def decrement(drink_type)
    drink_stocks.get(drink_type).decrement
  end

end
