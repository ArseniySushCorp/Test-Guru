class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct, presence: true
  validate :answers_amount, if: question.answers.size >= 4

  scope :all_correct, -> { where(correct: true) }

  def answers_amount
    errors.add(:answer, 'too much answers')
  end
end
