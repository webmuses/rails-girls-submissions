class AddSkillsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :html, :string
    add_column :submissions, :css, :string
    add_column :submissions, :js, :string
    add_column :submissions, :ror, :string
    add_column :submissions, :db, :string
    add_column :submissions, :programming_others, :string
  end
end
