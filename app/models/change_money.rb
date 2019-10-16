class ChangeMoney < ApplicationRecord
  has_many :coins

  def get_amount
    money.to_s
  end

  def clear
    coins.destroy_all
  end

  def add(obj)
    if obj.is_a?(Array)
      obj.each{ |_| _.update(change_money_id: self.id) }
    else
      obj.update(change_money_id: self.id)
    end
  end

# private

  def money_arr
    coins.map(&:to_money)
  end

  def money
    base_money = Money.new(amount: 0)
    money_arr.each { |money| base_money.add(money) }
    base_money
  end

end
