class SettingsController < ApplicationController
  layout 'dashboard'

  def settings
    render "/settings"
  end
end
