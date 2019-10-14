class Coin < ApplicationRecord
  belongs_to :change_money, optional: true
  belongs_to :one_hundred_yen_of_stock, optional: true

  enum kind: { one: 1, five: 5, ten: 10, fifty: 50, one_hundred: 100, five_hundred: 500 }

  validates :kind, presence: true

end
