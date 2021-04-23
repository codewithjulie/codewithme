class AssignmentsController < ApplicationController
  before_action :get_course
  before_action :get_assignment, only: [:show, :edit, :update, :destroy]
  before_action :require_enrolled_user, only: [:index, :show]
  before_action :require_admin, only: [:new, :create]

  def index
    @assignments = @course.assignments.order(:created_at)
  end

  def show
    @submission = @assignment.submissions.find_by(user_id: current_user.id)

  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = @course.assignments.new(assignment_params)
    if @assignment.valid?
      @assignment.save
      flash[:success] = "You successfully created the assignment"
      redirect_to course_assignment_path(@course, @assignment)
    else
      session[:error] = @assignment.errors.full_messages
      render "new"
    end

  end

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      flash[:success] = "You successfully edit the assignment"
      redirect_to course_assignment_path(@course, @assignment)
    else
      session[:error] = @assignment.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @assignment.destroy
    flash[:success] = "You successfully deleted the assignment"
    redirect_to course_assignments_path(@course)
  end

  private

  def get_course
    @course = Course.find_by(id: params[:course_id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :content, :url)
  end

  def get_assignment
    @assignment = Assignment.find_by(id: params[:id])
  end

  def require_admin
    unless is_admin?
      flash[:danger] = "Not authorized"
      redirect_to announcements_path 
    end
  end

  def require_enrolled_user
    course = get_course

    unless current_user.enrolled?(course) || current_user.admin
      flash[:danger] = "You must be logged in"
      redirect_to courses_path
    end
  end
end
