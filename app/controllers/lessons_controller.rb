class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_user, only: [:show]
  def show
    @current_lesson = current_lesson
  end
  
  
  private
  
  def require_authorized_for_current_user
    current_course = current_lesson.section.course
    unless current_user.enrolled_in?(current_course)
      redirect_to course_path(current_course), alert: "You need to be enrolled"
    end
   end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
