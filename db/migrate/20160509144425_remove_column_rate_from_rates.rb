class RemoveColumnRateFromRates < ActiveRecord::Migration
  def change
    remove_column :rates, :rate, :integer
  end
end
