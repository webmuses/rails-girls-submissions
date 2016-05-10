class RatesController < ApplicationController
  # before_action :authenticate_user!
  helper_method :current_user

  def create
    submission_rater = SubmissionRater.new
    rated = submission_rater.set_rate(current_user, params[:submission_id], params[:rate])

    if rated
      redirect_to :back, notice: 'Submission was rated successfully'
    else
      redirect_to :back, error: 'Submission was not rated'
    end
  end
end
