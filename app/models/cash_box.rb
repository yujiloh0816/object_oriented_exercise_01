class CashBox < ApplicationRecord
  belongs_to :coin_mech
  has_many :coins
end
