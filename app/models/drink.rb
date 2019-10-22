class Drink < ApplicationRecord
  belongs_to :drink_type
  belongs_to :drink_stock, optional: true

end
