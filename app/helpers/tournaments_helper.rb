module TournamentsHelper
  def current_phase
    @tournament.phases[@tournament.current_phase]
  end
end
