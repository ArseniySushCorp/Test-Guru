class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validates :correct, presence: true
  validate :answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  def answers_amount
    errors.add(:answer, 'too much answers') if question && question.answers.size >= 4
  end
end
