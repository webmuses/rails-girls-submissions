class RatesController < ApplicationController

  def create
    value = Integer(params[:value])
    submission_id = Integer(params[:submission_id])
    user_id = current_user.id

    rated = RateCreator.build(value, submission_id, user_id)

    redirect_to :back
  end
end
