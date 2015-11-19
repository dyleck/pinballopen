class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit]

  def show

  end

  def new
    @tournament = Tournament.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end
end
