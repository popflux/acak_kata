class AddShuffleWordToQuiz < ActiveRecord::Migration
  def up
    add_column :quizzes, :shuffle_word, :string
  end

  def down
  	remove_column :quizzes, :shuffle_word
  end
end
