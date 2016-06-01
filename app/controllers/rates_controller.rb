class RatesController < ApplicationController

  def create
    submission_rater = SubmissionRater.new

    value = Integer(params[:value])
    submission_id = Integer(params[:submission_id])
    user_id = current_user.id

    if submission_rater.user_has_already_rated?(submission_id, user_id)
      redirect_to :back, notice: 'You have already rated this submission'
    else
      rated = submission_rater.create_rate(value, submission_id, user_id)
      if rated
        redirect_to :back, notice: 'Submission was rated successfully'
      else
        redirect_to :back, error: 'Submission was not rated'
      end
    end
  end
end
