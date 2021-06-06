class Answer < ApplicationRecord
  validates :text, presence: true
  validates :correct, presence: true
  validate :answers_amount

  belongs_to :question

  scope :all_correct, -> { where(correct: true) }

  def answers_amount
    errors.add(:answer, 'too much answers') if question.answers.size >= 4
  end
end
