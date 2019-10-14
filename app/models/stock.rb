class Stock < ApplicationRecord
  belongs_to :vending_machine
  belongs_to :coin, optional: true

end
