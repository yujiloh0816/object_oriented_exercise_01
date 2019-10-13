class VendingMachine < ApplicationRecord

  def buy(i, kind_of_type)
    # 100円と500円だけ受け付ける
    if i != 100 && i != 500
      self.charge += i
      return nil
    end

    if kind_of_type == "coke" && self.quantity_of_coke == 0
      self.charge += i
      return nil
    elsif kind_of_type == "diet_coke" && self.quantity_of_diet_coke == 0
      self.charge += i
      return nil
    elsif kind_of_type == "tea" && self.quantity_of_tea == 0
      self.charge += i
      return nil
    end

    # 釣り銭不足
    if i == 500 && self.number_of_100_yen < 4
      self.charge += i
      return nil
    end

    if i == 100
      self.number_of_100_yen += 1
    elsif i == 500
      self.charge += (i - 100)
      self.number_of_100_yen -= (i - 100) / 100
    end

    if kind_of_type == "coke"
      self.quantity_of_coke -= 1
    elsif kind_of_type == "diet_coke"
      self.quantity_of_diet_coke -= 1
    elsif kind_of_type == "tea"
      self.quantity_of_tea -= 1
    end

    self.save
    Drink.create(kind: kind_of_type)

  end

  def refund
    result = self.charge
    self.update!(charge: 0)
    return result
  end

end
