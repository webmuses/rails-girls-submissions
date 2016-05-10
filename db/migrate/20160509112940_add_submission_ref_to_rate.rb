class AddSubmissionRefToRate < ActiveRecord::Migration
  def change
    add_reference :rates, :submission, index: true, foreign_key: true
  end
end
