class CashBox < ApplicationRecord
  belongs_to :coin_mech
  has_many :coins

  def has_change_money?
    coins.only_one_hundred.count >= 4
  end

  def take_out_change_money
    coins.limit(4)
  end

end
