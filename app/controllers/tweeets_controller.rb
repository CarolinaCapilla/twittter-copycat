class TweeetsController < ApplicationController
  before_action :set_tweeet, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @tweeets = Tweeet.all.order('created_at DESC')
    @tweeet = Tweeet.new
  end

  def show; end

  def new
    @tweeet = Tweeet.new
  end

  def edit; end

  def create
    @tweeet = Tweeet.new(tweeet_params)
    @tweeet.user = current_user

    if @tweeet.save
      redirect_to root_path, notice: 'Tweeet was successfully created.'
    else
      render :new
    end
  end

  def update
    if @tweeet.update(tweeet_params)
      redirect_to root_path, notice: 'Tweeet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tweeet.destroy
    redirect_to root_path, notice: 'Tweeet was successfully destroyed.'
  end

  private

  def set_tweeet
    @tweeet = Tweeet.find(params[:id])
  end

  def tweeet_params
    params.require(:tweeet).permit(:tweeet)
  end
end
