class AddNicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    change_column_null :users, :nickname, false
  end
end
