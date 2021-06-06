class Question < ApplicationRecord
  validates :text, presence: true

  belongs_to :test

  has_many :answers, dependent: :destroy
end
