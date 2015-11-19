class Phase < ActiveRecord::Base
  belongs_to :tournament
  has_many :rounds
  self.inheritance_column = :type

  def self.types
    %w(Qualification)
  end

end