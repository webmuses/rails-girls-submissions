class AddColumnValueToRates < ActiveRecord::Migration
  def change
    add_column :rates, :value, :integer
  end
end
