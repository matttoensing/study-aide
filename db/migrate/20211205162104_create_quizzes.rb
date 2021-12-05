class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :subject
      t.string :description
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
