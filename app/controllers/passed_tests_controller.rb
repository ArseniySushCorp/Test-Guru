class PassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_passed_test, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])

    if @passed_test.completed?
      TestMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@passed_test.current_question).call

    falsh_options = if result.success?
                      Gist.create(url: result.html_url, user: current_user, question: @passed_test.current_question)

                      { notice: helpers.link_to(t('.success'), result.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @passed_test, falsh_options
  end

  private

  def set_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
