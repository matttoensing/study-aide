class AddFinishingTimeToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :finishing_time, :time
    remove_column :assessments, :time
    add_column :assessments, :starting_time, :time
  end
end
