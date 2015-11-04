class Match < ActiveRecord::Base
  belongs_to :table
  has_many :scores
  has_many :users, through: :scores
end
