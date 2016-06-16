class Submission < ActiveRecord::Base
  validates :full_name, :age, :email, :codecademy_username, :description, :html, :css, :js, :ror, :db,
            :programming_others, :english, :operating_system, :goals, presence: true
  validates_inclusion_of :first_time, in: [true, false]
  validates :age, numericality: { greater_than: 0, less_than: 110 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true

  has_many :rates
  has_many :comments

  SKILLS = ['html', 'css', 'js', 'ror', 'db', 'programming_others']

  def status
    if self.rejected
      "rejected"
    else
      self.rates.length >= SubmissionRepository::REQUIRED_RATES_NUM ? "rated" : "pending"
    end
  end

  def rated?
    self.status == "rated"
  end

  def reject
    self.rejected = true
  end

  def average_rate
    if rates.count == 0
      0
    else
      self.rates.sum(:value).to_f  / self.rates.count
    end
  end
end
