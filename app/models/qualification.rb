class Qualification < Phase

  def init
    self.tournament.users.each do |user|
      self.users << user    # assign each user from the tournament
    end
    self.save!
  end

  def get_points_for_user_at_table(user, table)
    user_score = Score.where(:user_id => user)
      .joins(:match).where('matches.table_id' => table, 'matches.round_id' => self.rounds)
      .first.value
    count_of_greater_scores = Score.joins(:match).where('matches.table_id' => table, 'matches.round_id' => self.rounds)
      .count(:conditions => ['scores.value > ?', user_score])

    self.users.count - count_of_greater_scores
  end

  def get_table_standing_for_user(user, table)
    self.users.count - get_points_for_user_at_table(user, table) + 1
  end
end