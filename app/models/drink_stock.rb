class DrinkStock < ApplicationRecord
  belongs_to :drink_storage
  belongs_to :drink_type
  has_many :drinks

  def is_empty?(drink_type)
    type_of_drinks(drink_type).empty?
  end

  def take_out(drink_type)
    drink = type_of_drinks(drink_type).first
    drink.update!(drink_stock: nil)
    drink
  end

private

  def type_of_drinks(drink_type)
    drinks.where(drink_type: drink_type)
  end

end
