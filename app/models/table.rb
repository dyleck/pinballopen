class Table < ActiveRecord::Base
  has_many :matches

  def get_points_for_player_in_current_phase(user_id, phase)
    user = User.find(user_id)
    phase.get_points_for_user_at_table(user, self)
  end

  def get_player_standing_at_table_in_current_phase(user_id, phase)
    user = User.find(user_id)
    phase.get_table_standing_for_user(user, self)
  end
end
