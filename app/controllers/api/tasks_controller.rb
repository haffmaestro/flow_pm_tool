class Api::TasksController < ApplicationController
  before_action :find_project, only: [:index]
  before_action :find_tasks, only: [:index]
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    #render json: @project

  end

  def create
    @project  = Project.find params[:project_id]
    @task     = Task.new task_params
    @task.project = @project
    if @task.save
      render json: {saved: true}
    else
      render json: {saved: true}
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
    @project = Project.find (@task.project_id)
    if @task.destroy
      render json: {destroyed: true}
    else
      render json: {destroyed: false}
    end
  end

  private

  def find_project
    @project = Project.find params[:project_id]
  end

  def find_tasks
    @tasks = @project.tasks
  end

  def task_params
    params.require(:task).permit(:title, :due_date)
  end

  def find_task
    @task = Task.find params[:id]
  end

  def notice_creator(action, success=true)
    "#{@task.title} "+action+(success ? " successfully." : "failure.")
  end
end

