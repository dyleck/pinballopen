class Tournament < ActiveRecord::Base
  has_many :phases
  accepts_nested_attributes_for :phases
end
