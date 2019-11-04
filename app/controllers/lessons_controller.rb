class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson.section.course, only: [:show]
  def show
    @vurrent_lesson = current_lesson.section.course
  end
  
  def create
    @current_lesson = current_user.lesson.create(lesson_params)
    if @current_lesson

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
