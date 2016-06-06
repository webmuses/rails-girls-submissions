class CommentsController < ApplicationController
  before_action :set_submission
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.build({ body: comment_params[:body], submission: @submission, user: current_user })

    if @comment.save
      redirect_to @submission, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end


  def update
    if @comment.update(comment_params)
      redirect_to submission_comment_path, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @comment.destroy
    redirect_to @submission, notice: 'Comment was successfully destroyed.'
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_submission
      @submission = Submission.find(params[:submission_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
