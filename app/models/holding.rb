class Holding < ApplicationRecord
  belongs_to :User
  belongs_to :Stock
end
