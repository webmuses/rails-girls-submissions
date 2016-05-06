class RatesController < ApplicationController
  def create
    submission_rater = SubmissionRater.new(params[:rate])
    submission_rater.rate
    redirect_to :back
  end
end
