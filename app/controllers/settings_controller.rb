class SettingsController < ApplicationController
  layout 'dashboard'

  def index
    settings = Setting.get
    render :index, locals: { settings: settings }
  end

  def update
    Setting.set(settings["accepted_threshold"], settings["waitlist_threshold"], settings["required_rates_num"],
      settings["beginning_of_preparation_period"], settings["beginning_of_registration_period"],
      settings["beginning_of_closed_period"])
    redirect_to :back, notice: "Settings are updated"
  end

  private

  def settings
    params.require(:setting).permit(:accepted_threshold, :waitlist_threshold, :required_rates_num,
      :beginning_of_preparation_period, :beginning_of_registration_period, :beginning_of_closed_period)
  end
end
