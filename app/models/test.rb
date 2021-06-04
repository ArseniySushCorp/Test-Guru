class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :tests

  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests
  has_many :questions, dependent: :destroy

  def self.names_by_category(name)
    joins(:category).where(categories: { title: name }).order(:title).pluck(:title)
  end
end
