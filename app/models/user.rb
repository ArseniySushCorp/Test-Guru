class User < ApplicationRecord
  validates :login, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  has_many :own_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
