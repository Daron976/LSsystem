class UserCoursesController < ApplicationController

  def create
    user_course = UserCourse.new(user_id: params[:user_id], course_id: params[:course_id])
    if user_course.save
      render json: { message: 'Course has been succesfully picked!' }, status: :ok
    else
      render json: { message: 'Error occured' }, status: :bad_request
  end

  def destroy
    user_course = UserCourse.find(params[:id])

    if user_course
      user_course.destroy
      render json: { message: 'User is no longer enrolled in this course' }, status: :ok
    else
      render json: { message: 'Course could not be deleted from user courses' }, status: :not_found
  end
end
