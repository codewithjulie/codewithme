class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :get_post, only: [:edit, :update, :destroy, :correct_user?]
  before_action :get_forum, only: [:edit, :update, :destroy, :index, :create]

  def index
    @posts = @forum.posts
    render "index", layout: false
  end

  def create
    body = params["post"]["body"]
    user_id = current_user.id
    @post = @forum.posts.new(body: body, user_id: user_id)
    if @post.valid?
      @post.save
      html = render(partial: 'post', locals: {post: @post})
      ActionCable.server.broadcast "forum_channel_#{@forum.id}", html: html
    else
      render "new"
    end
  end
  
  def edit
    unless correct_user?
      redirect_to forum_path(@forum)
    end

    render layout: false
  end

  def update
    body = params[:post][:body]

    if correct_user?
      if @post.update(body: body)
        redirect_to forum_path(@forum)
      else
        render "edit"
      end
    end
  end

  def destroy
    if correct_user? || current_user.admin
      @post.destroy
    end

    redirect_to forum_path(@forum)
  end

  private

  def correct_user?
    @post.user_id == current_user.id
  end

  def get_forum
    @forum = Forum.find_by(id: params[:forum_id])
  end

  def get_post
    @post = Post.find_by(id: params[:id])
  end
end
