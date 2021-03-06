class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :own_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
  has_many :gists, dependent: :destroy
  has_many :users_badges
  has_many :badges, through: :users_badges

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :login, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def passed_test(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
