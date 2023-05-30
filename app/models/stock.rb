class Stock < ApplicationRecord
  belongs_to :industry
  has_many :watchlist_stocks
  has_many :watchlists, through: :watchlist_stocks
  has_many :holdings
  has_many :users, through: :holdings
	has_many :trades
  has_many :industry_stocks
  has_many :industries, through: :industry_stocks
end
