class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to @task, notice: notice_creator('created')
    else
      render :new
    end

  end

  def show
  end


  def edit
  end

  def update
    if @task.update task_params
      redirect_to @task, notice: notice_creator('updated')
    else
      @task.errors.full_messages.each do |message|
        flash.now[:alert] = message
      end
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: notice_creator('deleted')
    else
      flash.now[:alert] = notice_creator('delete', false)
      render :show
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end

  def find_task
    @task = Task.find params[:id]
  end

  def notice_creator(action, success=true)
    "#{@task.title} "+action+(success ? " successfully." : "failure.")
  end
end

