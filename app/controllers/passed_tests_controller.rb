class PassedTestsController < ApplicationController
  before_action :set_passed_test, only: %i[show update result]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      assign_badges
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end

  def assign_badges
    badges = BadgeService.new(@passed_test).call

    return if badges.empty?

    current_user.badges << badges
    flash[:notice] = 'You have a new badges, check it out!'
  end
end
