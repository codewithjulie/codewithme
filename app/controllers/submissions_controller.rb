class SubmissionsController < ApplicationController
  before_action :get_course
  before_action :get_assignment, except: :destroy
  before_action :get_submission, except: [:new, :create, :index]
  before_action :require_enrolled_user, only: [:index, :show]

  def new
    @submission = Submission.new
  end

  def index
    all_assignments = @course.assignments
    @submissions = []
    all_assignments.each do |assignment| 
      if !assignment.submissions.empty?
        assignment.submissions.each do |submission|
          @submissions << submission if submission.user_id == current_user.id
        end
      end
    end
  end

  def create
    user_id = current_user.id
    assignment_id = params[:assignment_id]

    body = params[:submission][:body]
    url = params[:submission][:url]

    # How to use strong parameters here?
    @submission = @assignment.submissions.new(body: body, url: url, user_id: user_id)
    if @submission.valid?
      @submission.save
      redirect_to course_assignment_submission_path(@course, @assignment, @submission)
    else
      session[:error] = @submission.errors.full_messages.last
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    body = params[:submission][:body]
    url = params[:submission][:url]

    if @submission.update(body: body, url: url)
      flash[:success] = "Your submission has been updated"
      redirect_to course_assignment_submission_path(@course, @assignment, @submission)
    else
      session[:error] = @submission.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @submission.destroy
    flash[:success] = "You have successfully deleted your assignment submission"
    redirect_to course_assignments_path(@course)
  end

  private

  def get_course
    @course = Course.find_by(id: params[:course_id])
  end

  def get_assignment
    @assignment = Assignment.find_by(id: params[:assignment_id])
  end

  def get_submission
    @submission = Submission.find_by(id: params[:id])
  end

  def require_enrolled_user
    unless current_user.enrolled?(@course) || current_user.admin
      flash[:danger] = "You must be logged in"
      redirect_to courses_path
    end
  end

end
