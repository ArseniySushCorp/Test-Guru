class User < ApplicationRecord
  validates :login, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :own_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
end
