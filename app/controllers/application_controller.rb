class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_variables

  def set_variables
    if controller_name == "courses" && action_name == "show"
      @course_view = Course.find_by(id: params[:id])
    else
      @course_view = Course.find_by(id: params[:course_id])
    end

    unless @course_view.nil?
      @assignments = @course_view.assignments.order(:created_at)
      @lectures = @course_view.lectures.order(:created_at)
    end
  end

  private

  def current_user
    User.find_by(id: session[:user_id])
  end
  
  helper_method :current_user

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    if session[:user_id]
      return true
    else
      session[:error] = "You must be logged in"
      return false
    end
  end

  helper_method :logged_in?

  def is_admin?
    current_user && current_user.admin?
  end

  helper_method :is_admin?

  def logged_in_user
    unless logged_in?
      flash[:danger] = "You must be logged in"
      redirect_to login_path
    end
  end

  helper_method :logged_in_user

end
