class ExercisesController < ApplicationController
  before_action :set_exercise, except: [:index, :new, :create]

  def index
    @exercises = current_user.exercises
  end

  def show

  end

  def new
    @exercise = current_user.exercises.new
  end

  def edit

  end

  def update
    if @exercise.update(exercise_params)
      flash[:notice] = "Exercise has been updated"
      # redirect_to user_exercise_path(current_user, @exercise)
      # is the same as
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = "Exercise has not been updated"
      render :edit
    end
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      flash[:notice] = "Exercise has been created"
      # redirect_to user_exercise_path(current_user, @exercise)
      # is the same as
      redirect_to [current_user, @exercise]
    else
      flash.now[:alert] = "Exercise has not been created"
      render :new
    end
  end

  def destroy
    if @exercise.destroy
      flash[:notice] = "Exercise has been deleted"
      redirect_to user_exercises_path(current_user)
    else
      flash.now[:alert] = "An error occured"
      render [current_user, @exercise]
    end
  end

  private

  def set_exercise
    @exercise = current_user.exercises.find params[:id]
  end

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end
end
