class CommentsController < ApplicationController
  before_action :set_sub
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comments = @sub.comments
    render component: 'Comments', props: { comments: @comments, sub: @sub }
  end
  def show
    render component: 'Comment', props: { comment: @comment, sub: @sub }
  end
  def new
    @comment = @sub.comments.new 
    render component: 'CommentNew', props: { comment: @comment, sub: @sub }
  end
  def create
    @comment = @sub.comments.new(topic_params)
    if @comment.save
      redirect_to root_path
    else
      render component: 'CommentNew', props: { comment: @comment, sub: @sub }
    end
  end
  def edit
    render component: 'CommentEdit', props: { comment: @comment, sub: @sub }
  end
  def update
    if @comment.update(topic_params)
      redirect_to root_path
    else
      render component: 'CommentEdit', props: { comment: @comment, sub: @sub }
    end
  end
  def destroy
    @comment.destroy
    redirect_to root_path
  end
  private 
    def set_sub
      @sub = Sub.find(params[:sub_id])
    end
    def set_topic
      @comment = Comment.find(params[:id])
      # @comment = @sub.comments.find(params[:id])
    end
    def topic_params 
      params.require(:comment).permit( :body)
    end
end
