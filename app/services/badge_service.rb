class BadgeService
  def initialize(passed_test)
    @current_passed_test = passed_test
    @user = passed_test.user
    @test = passed_test.test

    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def call
    @badges.select { |badge| send(badge.badge_type, badge.option) }
  end

  private

  def category?(category)
    test_ids = Test.by_category(category).ids
    test_ids.size == count_tests_success(test_ids) && @test.category.title == category
  end

  def first_try?(test_title)
    dublicate_tests = @user.passed_tests.select { |passed_test| passed_test.test.title.eql?(test_title) }

    dublicate_tests.size.eql?(1) && @current_passed_test.success?
  end

  def level?(level)
    test_ids = Test.where(level: level).ids
    test_ids.size == count_tests_success(test_ids) && @test.level == level.to_i
  end

  def count_tests_success(test_ids)
    @user.passed_tests.where(test_id: test_ids).select(&:success?).size
  end
end
