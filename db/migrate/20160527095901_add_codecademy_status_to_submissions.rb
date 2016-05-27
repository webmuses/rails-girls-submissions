class AddCodecademyStatusToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :codecademy_status, :string, default: "pending"
  end
end
