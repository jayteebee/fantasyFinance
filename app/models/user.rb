class User < ApplicationRecord
    has_many :watchlists, dependent: :destroy
    has_many :holdings, dependent: :destroy
    has_many :stocks, through: :holdings
    has_many :trades
end
