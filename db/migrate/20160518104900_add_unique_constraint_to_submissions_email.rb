class AddUniqueConstraintToSubmissionsEmail < ActiveRecord::Migration
  def change
    add_index :submissions, :email, unique: true
  end
end
