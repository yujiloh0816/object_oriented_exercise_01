class Coin < ApplicationRecord
  has_many :stocks

  enum kind: { one: 1, five: 5, ten: 10, fifty: 50, one_hundred: 100, five_hundred: 500 }
end
