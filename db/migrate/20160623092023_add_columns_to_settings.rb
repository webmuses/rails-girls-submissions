class AddColumnsToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :beginning_of_preparation_period, :datetime
    add_column :settings, :beginning_of_registration_period, :datetime
    add_column :settings, :beginning_of_closed_period, :datetime
  end
end
