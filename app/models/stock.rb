class Stock < ApplicationRecord
has_many :watchlist_stocks
  has_many :watchlists, through: :watchlist_stocks
  has_many :holdings
  has_many :users, through: :holdings
	has_many :trades
end
