class AddAnswerToQuiz < ActiveRecord::Migration
  def up
    add_column :quizzes, :answer, :string
  end

  def down
    remove_column :quizzes, :answer
  end
end
