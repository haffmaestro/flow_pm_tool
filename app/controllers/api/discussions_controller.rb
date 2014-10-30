class Api::DiscussionsController < ActionController::Base
  def show
    @discussion = Discussion.find params[:id]
    render json: @discussion
  end
end