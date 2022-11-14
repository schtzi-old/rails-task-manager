class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params_create)
    @task.save
    redirect_to tasks_path
  end

  def edit; end

  def update
    @task.update(task_params_update)

    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params_create
    params.require(:task).permit(:title, :details)
  end

  def task_params_update
    params.require(:task).permit(:title, :details, :completed)
  end
end
