class Submission < ActiveRecord::Base
  validates :full_name, :age, :email, :codeacademy_username, :description, :html, :css, :js, :ror, :db,
            :programming_others, :english, :operating_system, :goals, presence: true
  validates_inclusion_of :first_time, in: [true, false]
  validates :age, numericality: { greater_than: 0, less_than: 110 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true

  has_many :rates

  SKILLS = ['html', 'css', 'js', 'ror', 'db', 'programming_others']
  REQUIRED_RATES_NUM = 3
end
