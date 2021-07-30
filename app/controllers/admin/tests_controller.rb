class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit start update destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.build(test_params)

    if @test.save
      redirect_to admin_tests_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def start
    if user_signed_in?
      current_user.tests.push(@test)

      redirect_to current_user.passed_test(@test)
    else
      redirect_to login_path
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path(@tests)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
