class MicroBlogsController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :get_micro_blog, only: [:show, :edit, :update, :destroy]
  before_action :micro_blog_params, only: [:create, :update]

  def index
    @micro_blogs = MicroBlog.order(created_at: :DESC).page(params[:page]).per(5)
  end

  def show
  end

  def new
    @micro_blog = MicroBlog.new
  end

  def create
    @micro_blog = MicroBlog.new(micro_blog_params)
    if @micro_blog.valid?
      @micro_blog.save
      flash[:success] = "You have successfully submitted a new entry"
      redirect_to micro_blog_path(@micro_blog)
    else
      session[:error] = @micro_blog.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @micro_blog.update(micro_blog_params)
      flash[:success] = "You have successfully updated entry"
      redirect_to micro_blog_path(@micro_blog)
    else
      session[:error] = @micro_blog.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @micro_blog.destroy
    flash[:success] = "You have successfully deleted entry"
    redirect_to micro_blogs_path
  end

  private

  def require_admin
    unless is_admin?
      flash[:danger] = "Not authorized"
      redirect_to micro_blogs_path 
    end
  end

  def get_micro_blog
    @micro_blog = MicroBlog.find_by(id: params[:id])
  end

  def micro_blog_params
    params.require(:micro_blog).permit(:title, :content)
  end
end
