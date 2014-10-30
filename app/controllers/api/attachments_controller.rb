class Api::AttachmentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @attachment = Attachment.new
    @attachment.resource = params[:file]
    @attachment.project = @project
    if @attachment.save
      render json: {saved: true}
    else
      render json: {saved: false}
    end
  end
end