class Test < ApplicationRecord
  validates :title, presence: true
  validates :level, presence: true, numericality: { only_integer: true }, uniqueness: { scope: :title }

  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :own_tests

  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :questions, dependent: :destroy

  scope :by_level, ->(level) { where(level: level) }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :names_by_category, ->(name) { joins(:category).where(categories: { title: name }).order(:title).pluck(:title) }
end
