class Role < ActiveRecord::Base
  include Comparable

  has_and_belongs_to_many :users

  def <=>(other)
    if self.name == 'SuperAdmin'
      return 1
    elsif self.name == 'Admin'
      return -1 if other.name == 'SuperAdmin'
      return 0 if other.name == 'Admin'
      return 1
    else
      return -1
    end
  end
end
