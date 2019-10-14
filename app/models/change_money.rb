class ChangeMoney < ApplicationRecord
  has_many :coins

  def get_amount
    coins.map(&:kind_before_type_cast).sum
  end

  def clear
    coins.destroy_all
  end

  # def clone_coins
  #   coins.clone
  # end

end
