class Question < ApplicationRecord
  validates :text, presence: true
  validates :number, presence: true

  belongs_to :test, inverse_of: :questions, foreign_key: true
  has_one :answer, dependent: :destroy
end
