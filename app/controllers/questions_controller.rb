class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[edit update show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.create(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    redirect_to test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def find_test
    @test = Test.find(params.require(:test_id))
  end

  def find_question
    @question = Question.find(params.require(:id))
  end

  def rescue_with_not_found
    render plain: 'Test not found'
  end
end
