users = User.create!([
  { login: "user-1", password: "password-1", email: "user-1@domain.com" },
  { login: "user-2", password: "password-2", email: "user-2@domain.com" },
])

category = Category.create!([
  { title: "Seed category - 1" },
  { title: "Seed category - 2" },
])

tests = Test.create!([
  { title: "Seed test - 1", level: 0, category: category.first, author: users.first },
  { title: "Seed test - 2", level: 1, category: category.first, author: users.first },

  { title: "Seed test - 3", level: 0, category: category.last, author: users.last },
  { title: "Seed test - 4", level: 1, category: category.last, author: users.last }
])

passed_tests = PassedTest.create!([
  { test: tests.first, user: users.first, current_questions: 0 },
  { test: tests[1], user: users.first, current_questions: 1 },
  { test: tests[2], user: users.first, current_questions: 2 },
])

questions = Question.create!([
  { text: "Seed question - 1 first test", test: tests.first },
  { text: "Seed question - 2 first test", test: tests.first },
  { text: "Seed question - 3 first test", test: tests.first },
  { text: "Seed question - 4 first test", test: tests.first },

  { text: "Seed question - 1 second test", test: tests.last },
  { text: "Seed question - 2 second test", test: tests.last },
  { text: "Seed question - 3 second test", test: tests.last },
  { text: "Seed question - 4 second test", test: tests.last },
])

answers = Answer.create!([
  { text: "Seed answer 1 first question first test", correct: true,  question: questions.first },
  { text: "Seed answer 2 first question first test", correct: false, question: questions.first },

  { text: "Seed answer 1 second question first test", correct: true, question: questions[1] },
  { text: "Seed answer 2 second question first test", correct: false, question: questions[1] },

  { text: "Seed answer 1 first question second test", correct: true, question: questions[4] },
  { text: "Seed answer 2 frist question second test", correct: false, question: questions[4] },

  { text: "Seed answer 1 second question second test", correct: true, question: questions[5] },
  { text: "Seed answer 2 second question second test", correct: false, question: questions[5] },
])
