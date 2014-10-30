class Api::UploadsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @project.resource = params[:file]
    @project.save
    render json: {saved: true}
  end
end