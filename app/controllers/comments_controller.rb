class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comments = Comment.all.where(tweeet_id: @tweeet)
  end

  def show; end

  def new
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.tweeet = Tweeet.find(params[:tweeet_id])
    @comment.user = current_user
    if @comment.save
      redirect_to @comment.tweet
    else
      render :new
    end
  end

  def edit
    @tweeet = @comment.tweeet
  end

  def update
    @comment.update(comments_params)
    if @comment.save
      redirect_to @comment.tweeet
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.tweeet
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
