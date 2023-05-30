class User < ApplicationRecord
    has_many :watchlists
    has_many :holdings
    has_many :stocks, through: :holdings
    has_many :trades
end
