class Score < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  has_one :table, through: :match

  def empty?
    return ( self.value == 0 or self.value.nil? ) ? true : false
  end
end
