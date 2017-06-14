require 'rails_helper'

RSpec.describe AnswersHelper, type: :helper do

    before do
        User.create(id: 1, email:"vincentpaoloclemenia@gmail.com", password: "ikealindseybautista", user_type: "Teacher")
        User.create(id: 2, email:"ikealindseybautista@gmail.com", password: "ikealindseybautista", user_type: "Student")
        Quiz.create!(id: 1, question: "What is 5 + 5?", answer: "5", user_id: 1)
        Answer.create!(id: 1, quiz_id: 1, user_id: 2, teacher_id: 1, ans: "five")
    end

	describe '#evaluate_if_zero' do
		context 'evalutes if equal to 0 or zero' do
		    it 'returns true if ' do
                answer = Answer.find(1)
                quiz = Quiz.find(1)
		      	expect(helper.evaluate_if_zero quiz.answer, answer.ans).to eq true
		    end
        end
	end

    describe '#evaluate_answer' do
		context 'converts the inpur either word or int' do
		    it 'returns true if ' do
                answer = Answer.find(1)
                quiz = Quiz.find(1)
		      	expect(helper.evaluate_if_zero quiz.answer, answer.ans).to eq true
		    end

            it 'returns false' do
                quiz = Quiz.find(1)
                stud_ans = "six"
                expect(helper.evaluate_if_zero quiz.answer, stud_ans).to eq false
            end

            it 'returns true' do
                quiz = Quiz.find(1)
                stud_ans = "five"
                expect(helper.evaluate_if_zero quiz.answer, stud_ans).to eq true
            end
            
            it 'retuns true' do
                quiz = Quiz.find(1)
                stud_ans = "f i v e"
                expect(helper.evaluate_if_zero quiz.answer, stud_ans).to eq true            
            end
        end
	end
end
