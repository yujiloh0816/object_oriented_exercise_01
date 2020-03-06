class DrinkStorage < ApplicationRecord
  belongs_to :vending_machine
  has_many :drink_stocks

  def is_empty?(drink_type)
    drink_stocks.is_empty?(drink_type)
  end

  def take_out(drink_type)
    drink_stocks.take_out(drink_type)
  end

end
