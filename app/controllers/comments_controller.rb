class CommentsController < ApplicationController

  def create
    body = comment_params[:body]
    submission_id = params[:submission_id]
    user_id = current_user.id

    comment_creator = CommentCreator.build(body, submission_id, user_id)
    result = comment_creator.call
    if result.success
      redirect_to submission_path(submission_id), notice: 'Comment was successfully created.'
    else
      submission = Submission.find(submission_id)
      render "submissions/show", locals: { submission: submission, comment: result.object }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
