class Test < ApplicationRecord
  validates :title, presence: true

  has_many :questions, dependent: :destroy
  has_one :category, dependent: :delete
  has_one :author, dependent: :nullify
end
