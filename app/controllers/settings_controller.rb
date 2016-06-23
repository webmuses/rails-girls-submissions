class SettingsController < ApplicationController
  layout 'dashboard'

  def index
    settings = Setting.get
    render :index, locals: { settings: settings }
  end

  def update
    Setting.set(setting_params)
    redirect_to :back, notice: "Settings are updated"
  end

  private

  def setting_params
    params.require(:setting).permit(:accepted_threshold, :waitlist_threshold, :required_rates_num,
      :beginning_of_preparation_period, :beginning_of_registration_period, :beginning_of_closed_period)
  end
end
