class GistQuestionService
  ResponseObject = Struct.new(:success?, :html_url)

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || http_client
  end

  def call
    response = @client.create_gist(gist_params)
    ResponseObject.new(response.html_url.present?, response.html_url)
  end

  private

  def http_client
    Octokit::Client.new(access_token: Rails.application.credentials.github[:access_token])
  end

  def gist_params
    {
      description: I18n.t('gists.description', title: @test.title),
      files: {
        I18n.t('gists.file_name') => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.text, *@question.answers.pluck(:text)].join("\n")
  end
end
