class RemoveExperienceFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :experience, :string
  end
end
