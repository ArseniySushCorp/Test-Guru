class PassedTest < ApplicationRecord
  SECONDS_PER_MINUTE = 60

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
    current_question.nil? || time_left.nil?
  end

  def result
    correct_questions / test.questions.size.to_f
  end

  def success?
    result > SUCCESS_PERCENTS
  end

  def question_position
    test.questions.order(:id).where('id <= ?', current_question.id).size
  end

  def time_left
    time = (passing_time - Time.current).to_i

    time >= 0 ? time : nil
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

  def passing_time
    created_at + test.timer * SECONDS_PER_MINUTE
  end
end
