class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit]

  def show

  end

  def new
    @tournament = Tournament.new
    @tournament.phases << Qualification.new(number_of_rounds: 10, matches_per_round: 1, players_per_round: 1,
                                            player_fixed: true, phase_fixed: false)
  end

  def create
    @tournament = Tournament.new tournament_params
    @tournament.save!
  end

  def edit
  end

  def update
  end

  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit!
    end
end
