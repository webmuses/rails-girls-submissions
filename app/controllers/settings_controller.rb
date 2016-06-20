class SettingsController < ApplicationController
  layout 'dashboard'

  def index
    settings = Settings.get
    render :index, locals: { settings: settings }
  end

  def update
    Settings.set(params["settings"]["accepted_threshold"], params["settings"]["waitlist_threshold"], params["settings"]["required_rates_num"])
    redirect_to :back, notice: "Settings are updated"
  end
end
