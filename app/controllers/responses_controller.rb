class ResponsesController < ApplicationController
  before_action :logged_in_user
  before_action :get_forum, only: [:new, :edit, :update, :destroy, :create]
  before_action :get_post, only: [:new, :edit, :update, :destroy, :create]
  before_action :get_response, only: [:destroy, :edit, :update, ]

  def index

  end

  def new
    @response = Response.new
    render "new", layout: false
  end

  def create
    body = params[:response][:body]
    @post.responses.create(body: body, user_id: current_user.id)
    redirect_to forum_path(@forum)
  end

  def edit
    unless correct_user?
      redirect_to forum_path(@forum)
    end
    render layout: false
  end
  
  def update
    body = params[:response][:body]

    if correct_user?
      if @response.update(body: body)
        redirect_to forum_path(@forum)
      else
        render "edit"
      end
    end
  end

  def destroy
    if correct_user? || current_user.admin
      @response.destroy
    end
    redirect_to forum_path(@forum)
  end

  private

  def correct_user?
    @response.user_id == current_user.id
  end

  def get_forum
    @forum = Forum.find_by(id: params[:forum_id])
  end

  def get_post
    @post = Post.find_by(id: params[:post_id])
  end

  def get_response
    @response = Response.find_by(id: params[:id])
  end
end