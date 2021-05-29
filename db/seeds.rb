User.find_or_create_by!(
  id: 42,
  login: 'user',
  email: 'user@guru.com',
) do |user|
  user.password = '123456'
end

Category.find_or_create_by!(
  id: 42,
  title: "Seed category"
)

Test.find_or_create_by!(
  id: 42,
  title: "Seed test",
  category_id: 42,
  author_id: 42,
)

Question.find_or_create_by!(
  id: 42,
  text: "Seed question",
  test_id: 42
)

Answer.find_or_create_by!(id: 40, text: "Seed answer 1", question_id: 42)

Answer.find_or_create_by!(id: 41, text: "Seed answer 2", question_id: 42)
