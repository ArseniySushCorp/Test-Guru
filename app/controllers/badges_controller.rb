class BadgesController < ApplicationController
  def index
    @erned_badges = current_user.badges
    @badges = Badge.where.not(id: @erned_badges.ids)
  end
end
