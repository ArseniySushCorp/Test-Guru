class Badge < ApplicationRecord
  BADGE_TYPES = %w[first_try? category? level?].freeze
  BADGE_IMG = %w[default_badge.png].freeze

  has_many :users_badges
  has_many :users, through: :users_badges

  validates :title, :description, :badge_type, presence: true
end
