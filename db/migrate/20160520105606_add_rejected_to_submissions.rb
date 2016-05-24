class AddRejectedToSubmissions < ActiveRecord::Migration
  def change
      add_column :submissions, :rejected, :boolean, default: false
  end
end
