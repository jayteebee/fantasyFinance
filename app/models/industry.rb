class Industry < ApplicationRecord
    has_many :industry_stocks
    has_many :stocks, through :industry_stocks
end
