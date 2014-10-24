class ProjectsController < ApplicationController
  before_action :find_projects, only: [:index, :show]
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :notify_paginate, only: [:index, :show]
  
  def index
    @search_term = params[:search]
    @projects = @projects.search(@search_term) if params[:search]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to @project, notice: notice_creator('created')
    else
      render :new
    end
  end

  def show
    @tasks = @project.tasks
    @task = Task.new
  end

  def edit() end

  def update
    if @project.update project_params
      redirect_to @project, notice: notice_creator('updated')
    else
      @project.errors.full_messages.each do |message|
        flash.now[:alert] = message
      end
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: notice_creator('deleted')
    else
      flash.now[:alert] = notice_creator('delete', false)
      render :show
    end
  end

  def search
    @search_term = params[:search]
    @projects = Project.search(@search_term).paginate(page: params[:page], per_page: 10)
  end

  private

  def notify_paginate
    @render_paginate = true
  end

  def find_projects
    @projects = Project.all.paginate(page: params[:page], per_page: 10)
  end

  def project_params
    params.require(:project).permit(:title, :description, :due_date, :category_id)
  end

  def find_project
    @project = Project.find params[:id]
  end

  def notice_creator(action, success=true)
    "#{@project.title} "+action+(success ? " successfully." : "failure.")
  end
end
