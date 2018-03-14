class Question < ActiveRecord::Base
  has_many :quizzes

  validates :name, presence: true, uniqueness: true
end
