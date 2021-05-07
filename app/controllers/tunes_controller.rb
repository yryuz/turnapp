class TunesController < ApplicationController
before_action :set_tune, only: [:edit,:show, :update, :destroy]
before_action :move_to_index, except: [:index, :show, :search]

  def index
    @tunes = Tune.includes(:user).order("created_at DESC")
  end

  def new
    @tune = Tune.new
  end

  def create
    @tune = Tune.create(tune_params)
    if @tune.save
      redirect_to tunes_path
    else
      render :new
    end
  end

  def destroy
   @tune.destroy
  end

  def edit
   
  end

  def update
    @tune.update(tune_params)
  end

  def show
  end

  private
  def tune_params
    params.require(:tune).permit(:url, :name, :artist, :genre_id, :text, :user, :image).merge(user_id: current_user.id)
  end 

  def set_tune
    @tune = Tune.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
