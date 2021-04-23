class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :get_user, only: [:show, :edit, :update, :submissions]
  before_action :require_admin, only: [:index]

  def index
    @users = User.search(params[:search])
  end

  def show
    user_courses = UserCourse.where(user_id: current_user.id)
    enrolled_user_courses = user_courses.where(enrolled: true)
    @enrolled_courses = enrolled_user_courses.map{|enrolled_user_course| Course.find_by(id: enrolled_user_course.course_id)}

    pending_user_courses = user_courses.where(enrolled: false)
    @pending_courses = pending_user_courses.map{|pending_user_course| Course.find_by(id: pending_user_course.course_id)}
    @courses = current_user.courses.where(enrolled: true)
    if @user.nil? || (current_user.id != @user.id)
      redirect_to :root
    end
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      # @user.send_activation_mail
      # flash[:info] = "Please check your email to activate your account."
      # redirect_to :root
      log_in @user
      flash[:success] = "Welcome to All Aboard Bootcamp!"
      redirect_to user_path(@user)
    else
      session[:error] = @user.errors.full_messages
      render "new"
    end
  end

  def edit
    # Make sure users cannot edit another user's account
    if @user != current_user
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "You have successfully updated your account"
      redirect_to user_path(@user)
    else
      session[:error] = @user.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    log_out
    flash[:success] = "You have sucessfully deleted your account"
    redirect_to :root
  end

  def submissions
    if current_user.admin
      @submissions = Submission.all
    elsif current_user == @user
      @submissions = Submission.where(user_id: current_user.id)
    else
      redirect_to :root
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :search)
  end

  def get_user
    @user = User.find_by(id: params[:id])
  end

  def require_admin
    unless is_admin?
      flash[:danger] = "Not authorized"
      redirect_to course_announcements_path(@course)
    end
  end

end
