class ChangeCodeacademyUsernameColumnName < ActiveRecord::Migration
  def change
    rename_column :submissions, :codeacademy_username, :codecademy_username
  end
end
