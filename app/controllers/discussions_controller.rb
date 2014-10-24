class DiscussionsController < ApplicationController
    before_action :find_discussion, only: [:update, :show, :destroy]
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
      @project = Project.find params[:project_id]
      @discussions = @project.discussions
      @comment = Comment.new
    end

    def edit
    end

    def update
      if @discussion.update discussion_params
        redirect_to :back, notice: notice_creator('updated')
      else
        redirect_to :back, notice: notice_creator('update', false)
      end
    end

    def destroy
      @discussion = Discussion.find params[:id]
      if @discussion.destroy
        redirect_to :back
      else
        redirect_to :back, notice: "Can't delete that one bub"
      end
    end

    private

    def discussion_params
      params.require(:discussion).permit(:title, :description)
    end

    def notice_creator(action, success=true)
      "#{@discussion.title} "+action+(success ? " successfully." : "failure.")
    end

    def find_discussion
      @discussion = Discussion.find params[:id]
    end
end
