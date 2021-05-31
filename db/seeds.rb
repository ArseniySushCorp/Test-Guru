users = User.create([
  { login: "user-1", password: "password-1", email: "user-1@domain.com" },
  { login: "user-2", password: "password-2", email: "user-2@domain.com" },
])

category = Category.create([
  { title: "Seed category - 1" },
  { title: "Seed category - 2" },
])

tests = Test.create([
  { title: "Seed test - 1", level: 0, category_id: category.first.id, author_id: users.first.id },
  { title: "Seed test - 2", level: 1, category_id: category.last.id, author_id: users.last.id }
])

questions = Question.create([
  { text: "Seed question - 1 first test", test_id: tests.first.id },
  { text: "Seed question - 2 first test", test_id: tests.first.id },
  { text: "Seed question - 3 first test", test_id: tests.first.id },
  { text: "Seed question - 4 first test", test_id: tests.first.id },

  { text: "Seed question - 1 second test", test_id: tests.last.id },
  { text: "Seed question - 2 second test", test_id: tests.last.id },
  { text: "Seed question - 3 second test", test_id: tests.last.id },
  { text: "Seed question - 4 second test", test_id: tests.last.id },
])

answer = Answer.create([
  { text: "Seed answer 1 first question first test", correct: true,  question_id: questions.first.id },
  { text: "Seed answer 2 first question first test", correct: false, question_id: questions.first.id },

  { text: "Seed answer 1 second question first test", correct: true, question_id: questions[1].id },
  { text: "Seed answer 2 second question first test", correct: false, question_id: questions[1].id },

  { text: "Seed answer 1 first question second test", correct: true, question_id: questions[4].id },
  { text: "Seed answer 2 frist question second test", correct: false, question_id: questions[4].id },

  { text: "Seed answer 1 second question second test", correct: true, question_id: questions[5].id },
  { text: "Seed answer 2 second question second test", correct: false, question_id: questions[5].id },
])
