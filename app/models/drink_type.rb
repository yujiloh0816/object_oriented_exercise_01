class DrinkType < ApplicationRecord
  has_many :drink_stocks
  has_many :drinks

  enum kind: { coke: 0, diet_coke: 1, tea: 2  }
end
