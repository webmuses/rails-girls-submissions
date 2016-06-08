class RatesController < ApplicationController
  def create
    value = Integer(params[:value])
    submission_id = Integer(params[:submission_id])
    user_id = current_user.id

    rate_creator = RateCreator.build(value, submission_id, user_id)
    rate_creator.call
    if !rate_creator.success?
      flash[:error] = rate_creator.errors
      redirect_to :back
    else
      redirect_to :back, notice: 'Rate was successfully created.'
    end
  end
end
