class Setting < ActiveRecord::Base

  def self.get
    self.first || self.create({
      accepted_threshold: 0,
      waitlist_threshold: 0,
      required_rates_num: 3
    })
  end

  def self.set(setting_params)
    settings = self.get
    settings.accepted_threshold = setting_params[:accepted_threshold]
    settings.waitlist_threshold = setting_params[:waitlist_threshold]
    settings.required_rates_num = setting_params[:required_rates_num]
    settings.beginning_of_preparation_period = setting_params[:beginning_of_preparation_period]
    settings.beginning_of_registration_period = setting_params[:beginning_of_registration_period]
    settings.beginning_of_closed_period = setting_params[:beginning_of_closed_period]

    settings.save!
  end

  def self.preparation_period?
    settings = self.get
    settings.beginning_of_preparation_period <= Time.now && Time.now < settings.beginning_of_registration_period
  end

  def self.registration_period?
    settings = self.get
    settings.beginning_of_registration_period <= Time.now && Time.now < settings.beginning_of_closed_period
  end
end
