class Api::DiscussionsController < ActionController::Base
  def show
    @discussion = Discussion.find params[:id]
    @project = Project.find @discussion.project_id
    render json: @discussion
  end
end