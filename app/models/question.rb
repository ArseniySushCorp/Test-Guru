class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :passed_tests, dependent: :destroy, inverse_of: :current_question, foreign_key: :current_question_id

  validates :text, presence: true
end
