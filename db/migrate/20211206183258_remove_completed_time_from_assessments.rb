class RemoveCompletedTimeFromAssessments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assessments, :completed_time
    add_column :assessments, :completed_time, :integer
  end
end
