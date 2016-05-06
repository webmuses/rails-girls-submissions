class RatesController < ApplicationController
  def create
    submission_rater = SubmissionRater.new
    submission_rater.rate(params[:rate])
    redirect_to :back
  end
end
