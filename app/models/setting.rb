class Setting < ActiveRecord::Base
  def self.get
    self.first || self.create({
      accepted_threshold: 0,
      waitlist_threshold: 0,
      required_rates_num: 3
    })
  end

  def self.set(accepted_threshold, waitlist_threshold, required_rates_num)
    settings = self.get
    settings.accepted_threshold = accepted_threshold
    settings.waitlist_threshold = waitlist_threshold
    settings.required_rates_num = required_rates_num
    settings.save!
  end
end
