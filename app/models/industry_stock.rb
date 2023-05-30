class IndustryStock < ApplicationRecord
  belongs_to :industry
  belongs_to :stock
end
