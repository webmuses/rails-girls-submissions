class RatesController < ApplicationController

  def create
    value = Integer(params[:value])
    submission_id = Integer(params[:submission_id])
    user_id = current_user.id

    if RateChecker.new.user_has_already_rated?(submission_id, user_id)
      redirect_to :back, notice: 'You have already rated this submission'
    else
      rated = RateCreator.build(value, submission_id, user_id)
      if rated
        redirect_to :back, notice: 'Submission was rated successfully'
      else
        redirect_to :back, error: 'Submission was not rated'
      end
    end
  end
end
