class DiscussionsController < ApplicationController
    def index
      @project = Project.find (params[:project_id])
      @discussions = @project.discussions
      @task = Task.new
      @comment = Comment.new
      @discussion = Discussion.new
    end

    def new
    end

    def create
      @project = Project.find params[:project_id]
      @discussion = Discussion.new discussion_params
      @discussion.project = @project
      if @discussion.save
        redirect_to :back, notice: notice_creator('created')
      else
        redirect_to :back, notice: notice_creator('creation', false)
      end
    end

    def show
      @discussion = Discussion.find params[:id]
      @project = Project.find params[:project_id]
      @discussions = @project.discussions
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def discussion_params
      params.require(:discussion).permit(:title)
    end

    def notice_creator(action, success=true)
      "#{@discussion.title} "+action+(success ? " successfully." : "failure.")
    end
end
