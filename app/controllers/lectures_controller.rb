class LecturesController < ApplicationController
  before_action :get_course
  before_action :get_lecture, only: [:show, :edit, :update, :destroy]
  before_action :require_enrolled_user, only: [:index, :show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @lectures = @course.lectures.order(:created_at)
  end

  def show
    @video_id = getVideoId(@lecture.url)
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = @course.lectures.new(lecture_params)
    if @lecture.save
      flash[:success] = "You have sucessfully created a new lecture"
      redirect_to course_lecture_path(@course, @lecture)
    else
      session[:error] = @lecture.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @lecture.update(lecture_params)
      flash[:success] = "You have successfully updated the lecture"
      redirect_to course_lecture_path(@course, @lecture)
    else
      session[:error] = @lecture.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @lecture.destroy
    flash[:success] = "You have sucessfully deleted the lecture"
    redirect_to course_lectures_path(@course)
  end

  private

  def require_admin
    unless is_admin?
      flash[:danger] = "Not authorized"
      redirect_to course_lectures_path(@course)
    end
  end

  def lecture_params
    params.require(:lecture).permit(:name, :url, :guest, :description)
  end

  def get_lecture
    @lecture = Lecture.find_by(id: params[:id])
  end

  def getVideoId (url)
    # This method was taken from stackoverflow: https://stackoverflow.com/questions/3452546/how-do-i-get-the-youtube-video-id-from-a-url
    if url.include?("youtu")
      regExp = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
      match = url.match(regExp)

      return match[2] if match
    end
    return nil
  end

  def get_course
    @course = Course.find_by(id: params[:course_id])
  end

  def require_enrolled_user
    unless current_user.enrolled?(@course) || current_user.admin
      flash[:danger] = "You must be logged in"
      redirect_to courses_path
    end
  end
end
