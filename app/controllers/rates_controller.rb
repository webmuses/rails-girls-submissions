class RatesController < ApplicationController

  def create
    submission_rater = SubmissionRater.new
    rated = submission_rater.set_rate(params[:rate], params[:submission_id], current_user.id)

    if rated
      redirect_to :back, notice: 'Submission was rated successfully'
    else
      redirect_to :back, error: 'Submission was not rated'
    end
  end
end
