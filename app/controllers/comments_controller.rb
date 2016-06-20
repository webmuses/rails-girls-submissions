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
      rate_presenters = create_rate_presenters(submission.rates)
      comment_presenters = create_comment_presenters(submission.comments)
      
      render "submissions/show", locals: { submission: submission,
        comment: result.object, comment_presenters: comment_presenters,
        rate_presenters: rate_presenters  }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def create_rate_presenters(rates)
      rates.map { |rate| RatePresenter.new(rate, rate.user) }
    end

    def create_comment_presenters(comments)
      comments.map { |comment| CommentPresenter.new(comment, comment.user) }
    end
end
