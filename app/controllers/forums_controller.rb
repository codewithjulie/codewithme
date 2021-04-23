class ForumsController < ApplicationController
  before_action :logged_in_user
  before_action :require_admin, only: [:new, :create]
  before_action :forum_params, only: [:create, :update]
  before_action :get_forum, only: [:show, :edit, :update, :destroy]

  def index
    @forum = Forum.find_by(title: "General") || Forum.first
    if @forum
      redirect_to forum_path(@forum)
    else
      render "index"
    end
  end

  def show
    @forums = Forum.all
    @users = User.order(:username)
    @post = Post.new
    @posts = @forum.posts
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    if @forum.valid?
      @forum.save
      flash[:success] = "You have successfully created a new forum"
      redirect_to forums_path
    else
      session[:error] = @forum.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @forum.update(forum_params)
      flash[:success] = "You have successfully updated the forum"
      redirect_to forum_path(@forum)
    else
      session[:error] = @forum.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @forum.destroy
    flash[:success] = "You have successfully deleted forum"
    redirect_to forums_path
  end

  private

  def forum_params
    params.require(:forum).permit(:title, :description)
  end

  def get_forum
    @forum = Forum.find_by(id: params[:id])
  end

  def require_admin
    unless is_admin?
      flash[:danger] = "Not authorized"
      redirect_to announcements_path 
    end
  end


end
