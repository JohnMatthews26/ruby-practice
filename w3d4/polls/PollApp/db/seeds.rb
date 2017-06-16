# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(user_name: 'ADE')
user2 = User.create(user_name: 'john')
poll1 = Poll.create(author_id: user1.id, title: 'Blue')
poll2 = Poll.create(author_id: user2.id, title: 'Dogs')
question1 = Question.create(poll_id: poll1.id, text: "What things are blue?")
question2 = Question.create(poll_id: poll2.id, text: "What is your favorite dog breed?")
answer_choice1 = AnswerChoice.create(question_id: question1.id, answer_choice: "sky")
answer_choice2 = AnswerChoice.create(question_id: question1.id, answer_choice: "jeans")
answer_choice3 = AnswerChoice.create(question_id: question1.id, answer_choice: "car")
answer_choice4 = AnswerChoice.create(question_id: question1.id, answer_choice: "turtle")
answer_choice5 = AnswerChoice.create(question_id: question2.id, answer_choice: "boxer")
answer_choice6 = AnswerChoice.create(question_id: question2.id, answer_choice: "pitbull")
answer_choice7 = AnswerChoice.create(question_id: question2.id, answer_choice: "squirrel")
response1 = Response.create(answer_choice_id: answer_choice3.id, user_id: user2.id)
response2 = Response.create(answer_choice_id: answer_choice7.id, user_id: user1.id)
