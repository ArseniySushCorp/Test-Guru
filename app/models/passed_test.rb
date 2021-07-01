class PassedTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true, inverse_of: :passed_tests

  before_validation :set_current_question, on: %i[create update]

  SUCCESS_PERCENTS = 0.85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def result
    correct_questions / test.questions.size.to_f
  end

  def success?
    result > SUCCESS_PERCENTS
  end

  private

  def set_current_question
    self.current_question = current_question.nil? ? test.questions.first : next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).find_by('id > ?', current_question.id)
  end
end
