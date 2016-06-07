class CommentsController < ApplicationController
  before_action :set_submission

  def create
    @comment = @submission.comments.build({ body: comment_params[:body], submission: @submission, user: current_user })

    if @comment.save
      redirect_to @submission, notice: 'Comment was successfully created.'
    else
      render "/submissions/show"
    end
  end

  private
    def set_submission
      @submission = Submission.find(params[:submission_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
