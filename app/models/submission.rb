class Submission < ActiveRecord::Base
  validates :full_name, :age, :description, :english, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18, less_than: 110 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :email, uniqueness: { case_sensitive: false }
  validates :full_name, :email, length: { maximum: 50 }
  validates :description, length: { maximum: 255 }

  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy

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

