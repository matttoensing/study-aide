class AddCompletedTimeToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :completed_time, :time
  end
end
