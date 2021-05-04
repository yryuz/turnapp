class TunesController < ApplicationController

  def index
    @tunes = Tune.all
  end

  def new
    @tune = Tune.new
  end

  def create
    Tune.create(tune_params)
  end

  private
  def tune_params
    params.require(:tune).permit(:url, :name, :artist, :genre_id, :text, :user, :image).merge(user_id: current_user.id)
  end

end
