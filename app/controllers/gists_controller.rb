class GistsController < ApplicationController
  before_action :find_passed_test

  def create
    result = GistQuestionService.new(@passed_test.current_question).call
    result_url = result.html_url

    falsh_options = if result.success?
                      create_gist(result_url, @passed_test.current_question)
                      { notice: helpers.link_to(t('.success'), result_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @passed_test, falsh_options
  end

  private

  def create_gist(url, question)
    current_user.gists.create(url: url, user: current_user, question: question)
  end

  def find_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
