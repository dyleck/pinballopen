class Qualification < Phase

  def init
    self.tournament.users.each do |user|
      self.users << user    # assign each user from the tournament
    end
    self.save!
  end
end