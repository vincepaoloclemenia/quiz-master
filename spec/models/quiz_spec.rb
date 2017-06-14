require 'rails_helper'

RSpec.describe Quiz, type: :model do

	before do
		registered_user = User.new(:id => 1, :email => 'vincentpaoloclemenia@gmail.com', :password => 'ikealindseybautista', :type => "Teacher")
		registered_user.save
	end

	describe "is valid to save" do 
	  	it "has all parameters needed to be saved" do 
			quiz = Quiz.new(question: "What is 5 x 5?", answer: "25", user_id: 1)
			expect(quiz.save).to be true 
		end
	end

	describe "is not valid to save" do

		it "it has a validation for name attribute" do 
			quiz = Quiz.new(question: nil, answer: nil, user_id: 1)
			expect(quiz.save).to be false
		end

	end

	it "has a association with Answer model" do 
		quiz = Quiz.reflect_on_association(:answers)
    	expect(quiz.macro) == :has_many
	end

	it "has a association with Question model" do 
		  quiz = Quiz.reflect_on_association(:user)
    	expect(quiz.macro) == :belongs_to
	end
end