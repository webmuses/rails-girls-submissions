class Submission < ActiveRecord::Base
  validates :full_name, :age, :email, :codecademy_username, :description, :html, :css, :js, :ror, :db,
            :programming_others, :english, :operating_system, :goals, presence: true
  validates_inclusion_of :first_time, in: [true, false]
  validates :age, numericality: { greater_than: 0, less_than: 110 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: { case_sensitive: false }
  validates :full_name, :email, :codecademy_username, length: { maximum: 50 }
  validates :description, :goals, :problems, length: { maximum: 255 }

  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy

  SKILLS = ['html', 'css', 'js', 'ror', 'db', 'programming_others']

  def status
    if rejected
      "rejected"
    else
      rates.length >= SubmissionRepository::REQUIRED_RATES_NUM ? "rated" : "pending"
    end
  end

  def rated?
    status == "rated"
  end

  def reject
    self.rejected = true
  end

  def average_rate
    rates.count == 0 ? 0 : (rates.sum(:value).to_f / rates.count)
  end
end
