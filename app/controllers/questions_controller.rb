class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def show; end

  def new; end

  def index
    @questions = @test.questions
  end

  def create
    @question = @test.questions.new(params.require(:question).permit(:text))

    if @question.save
      render plain: "Qustion ##{@question.id} created"
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    render plain: "Question #{@question.id} deleted"
  end

  private

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
