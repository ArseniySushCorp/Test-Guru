class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if user_signed_in?
      current_user.tests.push(@test)

      redirect_to current_user.passed_test(@test)
    else
      redirect_to login_path
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
