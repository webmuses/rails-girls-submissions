class Setting < ActiveRecord::Base
  validate :preparation_is_before_registration, :registration_is_before_closed

  def self.get
    self.first || self.create({
      accepted_threshold: 0,
      waitlist_threshold: 0,
      required_rates_num: 3,
      beginning_of_preparation_period: "2016-06-21 00:00:00 +0200",
      beginning_of_registration_period: "2016-06-22 00:00:00 +0200",
      beginning_of_closed_period: "2016-06-23 00:00:00 +0200"
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

  private

  def preparation_is_before_registration
    if beginning_of_registration_period < beginning_of_preparation_period
      errors.add(:beginning_of_preparation_period, "has to be before beginning_of_registration_period")
    end
  end

  def registration_is_before_closed
    if beginning_of_closed_period < beginning_of_registration_period
      errors.add(:beginning_of_registration_period, "has to be before beginning_of_closed_period")
    end
  end
end
