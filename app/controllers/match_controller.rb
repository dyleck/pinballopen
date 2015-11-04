class MatchController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.users << User.find(params[:match][:users])
    respond_to do |format|
      if @match.save
        format.html { redirect_to matches_url, notice: 'match created' }
      else
        # TODO error handling
      end
    end
  end

  private

    def match_params
      params.require(:match).permit(:users, :table_id)
    end
end
