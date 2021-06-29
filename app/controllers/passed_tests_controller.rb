class PassedTestsController < ApplicationController

  before_action :set_passed_test, only: %i[show update result]

  def show
  end

  def result
  
  end

  def update
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
