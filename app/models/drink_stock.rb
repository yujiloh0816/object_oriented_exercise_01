class DrinkStock < ApplicationRecord
  belongs_to :drink_storage
  belongs_to :drink_type

  def is_empty
    quantity == 0
  end

end
