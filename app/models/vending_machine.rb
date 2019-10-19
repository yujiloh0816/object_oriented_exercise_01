class VendingMachine < ApplicationRecord
  has_one :coin_mech
  has_one :drink_storage

  def buy(payment, kind_of_type)
    coin = Coin.create(kind: payment)
    drink_type = DrinkType.create(kind: kind_of_type)
    payment = coin_mech.put(payment)

    # 100円と500円だけ受け付ける
    unless coin.one_hundred? || coin.five_hundred?
      coin_mech.add_change_money(coin)
      return nil
    end

    # 在庫があるか確認
    if drink_storage.is_empty(drink_type)
      coin_mech.add_change_money(coin)
      return nil
    end

    # 500円の場合おつりがあるか確認
    if coin.five_hundred? && coin_mech.has_change?
      coin_mech.add_change_money(coin)
      return nil
    end

    coin_mech.commit

    drink_storage.take_out(drink_type)

  end

  def refund
    coin_mech.refund
  end

end