class Badge < ApplicationRecord
  BADGE_TYPES = %w[first_try? category? level?].freeze

  has_many :users, through: :users_badges

  validates :name, :description, :badge_type, presence: true
  validates :name, uniqueness: true
end
