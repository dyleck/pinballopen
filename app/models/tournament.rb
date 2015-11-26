class Tournament < ActiveRecord::Base
  has_many :phases, dependent: :destroy
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :phases

  def get_current_phase
    self.phases[self.current_phase]
  end

  def init
    self.phases[0].init
  end
end
