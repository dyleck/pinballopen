class Round < ActiveRecord::Base
  belongs_to :phase
  has_many :matches, dependent: :destroy
  has_many :users, through: :matches
  has_many :scores, through: :matches
  has_many :tables, through: :matches

  accepts_nested_attributes_for :matches
end
