class Score < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  has_one :table, through: :match
end
