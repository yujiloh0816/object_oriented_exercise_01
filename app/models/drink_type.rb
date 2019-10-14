class DrinkType < ApplicationRecord
  has_many :stocks

  enum kind: { coke: 0, diet_coke: 1, tea: 2  }
end
