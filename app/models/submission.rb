class Submission < ActiveRecord::Base
  validates :full_name, :age, :email, :codeacademy_username, :description, :html, :css, :js, :ror, :db,
            :programming_others, :english, :operating_system, :first_time, :goals, presence: true

  validates :age, numericality: {greater_than: 0, less_than: 110}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
