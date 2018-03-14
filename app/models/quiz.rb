class Quiz < ActiveRecord::Base
  belongs_to :question

  validates :question_id, presence: true
  validates :answer, presence: true
  validates :shuffle_word, presence: true

  def update_points
    self.update(points: 1)
  end

end
