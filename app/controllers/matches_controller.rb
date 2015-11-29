class MatchesController < ApplicationController
  before_action :set_tournament, only: [:create, :edit, :update]
  before_action :set_match, only: [:edit, :update]

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
    @match.scores << Score.new
  end

  def create
    @match = Match.new(match_params)
    matches_played_by_player =
        Match.where('table_id' => params[:match][:table]).joins(:scores).where('scores.user_id' => params[:match][:users])
    if matches_played_by_player.count > 0
      scores = [] << Score.find(matches_played_by_player.select('scores.id').where.not('scores.value' => [0, nil]).map(&:id))
      scores.flatten!
      if scores.length > 0
        # TODO: Add joker implementation, low priority
        redirect_to new_tournament_match_url, notice: 'Joker is not available'
        return
      else
        redirect_to edit_tournament_match_url(@tournament,
                                              matches_played_by_player.select('matches.id')
                                              .where('scores.value' => [0, nil]).first.id)
        return
      end
    else
      round = Round.new
      round.matches << @match
      @tournament.get_current_phase.rounds << round
    end
    respond_to do |format|
      if @match.save and @tournament.save
        format.html { redirect_to new_tournament_match_url(@tournament), notice: 'match created' }
      else
        # TODO error handling
      end
    end
  end

  def edit

  end

  def update
    if @match.update(match_params_correct)
      redirect_to new_tournament_match_path(@tournament), notice: "Scores updated"
    else
      # TODO error handling
    end
  end

  private

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

    def set_match
      @match = Match.find(params[:id])
    end

    def match_params_correct
      params.require(:match).permit!
    end

    def match_params # TODO WTF??
      p = params.require(:match).permit(:table, :users => [])
      p[:table] = Table.find p[:table].to_i
      p[:users].map! { |u| User.find(u.to_i) }
      p
    end
end
