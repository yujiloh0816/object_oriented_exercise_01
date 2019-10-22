class VendingMachine < ApplicationRecord
  has_one :coin_mech
  has_one :drink_storage

  def buy(coin, drink_type)
    coin_mech.put(coin)
    return nil unless coin_mech.has_change_money?
    return nil if drink_storage.is_empty?(drink_type)
    coin_mech.commit
    drink_storage.take_out(drink_type)
  end

  def refund
    coin_mech.refund
  end

end