class OneHundredYenOfStock < ApplicationRecord
  belongs_to :vending_machine
  has_many :coins

end