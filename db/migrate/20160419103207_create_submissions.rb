class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :full_name
      t.string :email
      t.integer :age
      t.string :codeacademy_username
      t.text :description
      t.string :experience
      t.string :english
      t.string :operating_system
      t.boolean :first_time
      t.text :goals
      t.text :problems

      t.timestamps null: false
    end
  end
end
