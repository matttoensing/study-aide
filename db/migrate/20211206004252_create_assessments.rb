class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.integer :status, default: 0
      t.float :score
      t.integer :number_of_questions
      t.time :time
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
