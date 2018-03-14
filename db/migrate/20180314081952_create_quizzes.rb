class CreateQuizzes < ActiveRecord::Migration
  def up
    create_table :quizzes do |t|
      t.integer :question_id
      t.integer :points, default: 0

      t.timestamps null: false
    end
  end

  def down
    drop_table :quizzes
  end
end
