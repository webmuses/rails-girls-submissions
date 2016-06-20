class SettingsController < ApplicationController
  layout 'dashboard'

  def index
    settings = Settings.get
    render :index, locals: { settings: settings }
  end

  def update
    Settings.set(settings["accepted_threshold"], settings["waitlist_threshold"], settings["required_rates_num"])
    redirect_to :back, notice: "Settings are updated"
  end

  private

  def settings
    params.require(:settings).permit(:accepted_threshold, :waitlist_threshold, :required_rates_num)
  end
end
