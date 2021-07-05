class User < ApplicationRecord
  has_many :own_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  validates :login, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
