class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :accepted_threshold
      t.integer :waitlist_threshold
      t.integer :required_rates_num

      t.timestamps null: false
    end
  end
end
