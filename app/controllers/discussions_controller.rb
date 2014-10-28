class DiscussionsController < ApplicationController
    before_action :find_discussion, only: [:update, :show, :destroy, :create]
    before_action :find_project, only: [:create]
    before_action :find_discussions, only: [:create, :show ]

    def index
      @project = Project.find params[:project_id]
      @discussions = @project.discussions
      @task = Task.new
      @comment = Comment.new
      @discussion = Discussion.new
    end

    def new
    end

    def create
      @discussion = Discussion.new discussion_params
      @discussion.project = @project
      if @discussion.save
        redirect_to :back, notice: notice_creator('created')
      else
        redirect_to :back, notice: notice_creator('creation', false)
      end
    end

    def show
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
    def find_project
      @project = @discussion.project
    end
    def find_discussions
      @discussions = @discussion.project.discussions
    end
end
