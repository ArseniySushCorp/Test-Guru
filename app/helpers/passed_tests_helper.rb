module PassedTestsHelper
  def score(passed_test)
    percents = to_percents(passed_test.result)

    tag.span percents, class: passed_test.success? ? 'green-text' : 'red-text'
  end

  def closing_message(passed_test)
    tag.p "Test #{passed_test.success? ? 'passed successfully' : 'failed'}"
  end

  private

  def to_percents(number)
    "#{(number * 100).round}%"
  end
end
