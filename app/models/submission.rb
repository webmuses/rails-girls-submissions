class Submission < ActiveRecord::Base
  validates :full_name, presence: true
  validates :age, presence: true, numericality: {greater_than: 0, less_than: 110}
  validates :email, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :codeacademy_username, presence: true
  validates :description, presence: true
  validates :html, presence: true
  validates :css, presence: true
  validates :js, presence: true
  validates :ror, presence: true
  validates :db, presence: true
  validates :programming_others, presence: true
  validates :english, presence: true
  validates :operating_system, presence: true
  validates :first_time, presence: true
  validates :goals, presence: true


end
