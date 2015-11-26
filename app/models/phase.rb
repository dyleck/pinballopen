class Phase < ActiveRecord::Base
  belongs_to :tournament
  has_many :rounds
  has_and_belongs_to_many :users
  self.inheritance_column = :type

  def self.types
    %w(Qualification)
  end

  def name
    self.class.name.gsub(/_/, ' ').capitalize
  end

  def init
    raise "AbstractMethod"
  end
end