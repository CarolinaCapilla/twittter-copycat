class TweeetsController < ApplicationController
  before_action :set_tweeet, only: [:show, :edit, :update, :destroy]

  def index
    @tweeets = Tweeet.all.order("created_at DESC")
    @tweeet = Tweeet.new
  end

  def show
  end

  def new
    @tweeet = Tweeet.new
  end

  def edit
  end

  def create
    @tweeet = Tweeet.new(tweeet_params)

    if @tweeet.save
      redirect_to @tweeet, notice: 'Tweeet was successfully created.'
    else
      render :new
    end
  end


  def update
    if @tweeet.update(tweeet_params)
      redirect_to @tweeet, notice: 'Tweeet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tweeet.destroy
    redirect_to tweeets_url, notice: 'Tweeet was successfully destroyed.'
  end

  private
    def set_tweeet
      @tweeet = Tweeet.find(params[:id])
    end

    def tweeet_params
      params.require(:tweeet).permit(:tweeet)
    end
end
