class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show edit start update destroy]
  before_action :find_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit; end

  def start
    @user.tests.push(@test)
    redirect_to @user.passed_test(@test)
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end
end
