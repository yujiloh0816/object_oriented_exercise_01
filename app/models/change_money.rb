class ChangeMoney < ApplicationRecord
  belongs_to :payment
  has_many :coins

  def add(obj)
    if obj.is_a?(Array)
      obj.each{ |_| _.update(change_money_id: self.id) }
    else
      obj.update(change_money_id: self.id)
    end
  end

  def refund
    change_coins = coins.dup
    coins.destroy_all
    change_coins
  end

end
