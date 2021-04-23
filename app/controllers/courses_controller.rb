class CoursesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy, :submissions]
  before_action :get_course, except: [:index, :new, :create]
  # before_action :set_variables

  def index
    @courses = Course.order(:title)
    if current_user && !current_user.admin
      user_courses = UserCourse.where(user_id: current_user.id)
      @courses_enrolled = []
      @courses_pending = []
      user_courses.each do |user_course|
        if user_course.enrolled
          @courses_enrolled << Course.find_by(id: user_course.course_id)
        else
          @courses_pending << Course.find_by(id: user_course.course_id)
        end
      end
      all_courses = Course.order(:title)
      @courses = all_courses.select {|course| !@courses_enrolled.include?(course) && !@courses_pending.include?(course)}
      
    end
  end

  def show
    @user_courses = @course.user_courses.where(enrolled: true)
    @pending = @course.user_courses.where(enrolled: false)
  end

  def submissions
    all_assignments = @course.assignments
    @submissions_index = []
    all_assignments.each do |assignment| 
      if !assignment.submissions.empty?
        assignment.submissions.each do |submission|
          @submissions_index << submission
        end
      end
    end
    @submissions = Submission.search(params[:search]) || @submissions_index
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.valid?
      @course.save
      flash[:success] = "You have successfully created a new course"
      redirect_to course_path(@course)
    else
      session[:error] = @course.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update

    if @course.update(course_params)
      flash[:success] = "You have successfully updated the course"
      redirect_to course_path(@course)
    else
      session[:error] = @course.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @course.destroy

    flash[:success] = "You have successfully deleted the course"
    redirect_to courses_path
  end

  private

  def submissions_params
    params.require(:submission).permit(:search)
  end

  def get_course
    @course = Course.find_by(id: params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :short_description, :description, :image_url)
  end

  def require_admin
    unless is_admin?
      @course = Course.find_by(id: params[:id])

      flash[:danger] = "Not authorized"
      redirect_to course_path(@course)
    end
  end

  # def set_variables
  #   @course_view = Course.find_by(id: params[:id])

  #   unless @course_view.nil?
  #     @assignments = @course_view.assignments
  #     @lectures = @course_view.lectures
  #   end
  # end
end
