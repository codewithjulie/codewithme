class UserCoursesController < ApplicationController
  def create
    user_course = UserCourse.new(course_id: params[:course_id], user_id: params[:user_id])
    if user_course.save
      flash[:info] = "Thank you for your interest, someone will let you in soon"
      redirect_to course_path(user_course.course_id)
    else
      flash[:danger] = "Something went wrong"
      redirect_to :root
    end
  end

  def update
    user_course = UserCourse.find_by(id: params[:id])
    user_course.toggle!(:enrolled)
    redirect_to course_path(user_course.course_id)
  end

  def destroy
    user_course = UserCourse.find_by(id: params[:id])
    user_course.destroy
    flash[:info] = "You have successfully unenrolled from the course"
    redirect_to course_path(user_course.course_id)
  end
end
