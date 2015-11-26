class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :init]

  def show

  end

  def new
    @tournament = Tournament.new
    @tournament.phases << [ Qualification.new(number_of_rounds: 10, matches_per_round: 1, players_per_round: 1,
                                            player_fixed: true, phase_fixed: false),
                            DoubleKO.new(number_of_rounds: 64, matches_per_round: 3, players_per_round: 2,
                                        player_fixed: false, phase_fixed: true),
                            Final.new(number_of_rounds: 1, matches_per_round: 3, players_per_round: 3,
                                      player_fixed: false, phase_fixed: true) ]
  end

  def create
    @tournament = Tournament.new tournament_params
    if @tournament.save
      redirect_to @tournament
    else
      #TODO error handling
    end
  end

  def edit

  end

  def update
    if @tournament.update tournament_params
      redirect_to tournament_url
    else
      # TODO error handling
    end
  end

  def init
    @tournament.init
    redirect_to new_tournament_match_url(@tournament)
  end

  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit!
    end
end
