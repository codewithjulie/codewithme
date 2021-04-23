class AnnouncementsController < ApplicationController
  before_action :get_course
  before_action :get_announcement, only: [:show, :edit, :update, :destroy]
  before_action :require_enrolled_user, only: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @announcements = @course.announcements.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
  end
  
  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = @course.announcements.new(announcement_params)
    if @announcement.valid?
      @announcement.save
      flash[:success] = "You have successfully created an announcement"
      redirect_to course_announcement_path(@course, @announcement)
    else
      session[:error] = @announcement.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @announcement.update(announcement_params)
      flash[:success] = "You have successfully edited your announcement"
      redirect_to course_announcement_path(@course, @announcement)
    else
      session[:error] = @announcement.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @announcement.destroy
    flash[:success] = "You have successfully deleted your announcement"
    redirect_to course_announcements_path(@course)
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :body)
  end

  def get_announcement
    @announcement = Announcement.find_by(id: params[:id])
  end

  def get_course
    @course = Course.find_by(id: params[:course_id])
  end

  def require_admin
    unless is_admin?
      flash[:danger] = "Not authorized"
      redirect_to course_announcements_path(@course)
    end
  end

  def require_enrolled_user
    unless current_user.enrolled?(@course) || current_user.admin
      flash[:danger] = "You must be logged in"
      redirect_to courses_path
    end
  end
end
