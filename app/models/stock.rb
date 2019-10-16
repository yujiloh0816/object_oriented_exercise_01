class Stock < ApplicationRecord
  belongs_to :vending_machine

  def is_empty
    quantity == 0
  end

end
