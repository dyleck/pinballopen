class Match < ActiveRecord::Base
  belongs_to :table
  belongs_to :round
  has_many :scores
  has_many :users, through: :scores
end
