class Submission < ActiveRecord::Base
  validates :full_name, :age, :description, :goals, :english, :html, :css,
            :js, :programming_others, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than: 110 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :email, uniqueness: { case_sensitive: false }
  validates :full_name, :email, length: { maximum: 50 }
  validates :first_time, inclusion: { in: [true, false] }
  validates :description, :goals, length: { maximum: 2000 }

  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy

  SKILLS = { html: 'HTML',  css: 'CSS' , js: 'JavaScript', programming_others: 'jakiś inny język programowania' }

  def status
    if rejected
      "rejected"
    else
      rates.length >= Setting.get.required_rates_num ? "rated" : "pending"
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

