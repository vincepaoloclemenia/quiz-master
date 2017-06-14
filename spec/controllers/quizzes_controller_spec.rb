require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
    before do
		allow(controller).to receive(:authenticate_user!).and_return(true)
		allow(controller).to receive(:authorized_user).and_return(true) 		
		registered_user = User.create!(id: 1, email: 'vincentpaoloclemenia@gmail.com', password: 'ikealindseybautista', user_type: "Teacher")
		registered_quiz = Quiz.create!(id: 1, question: "What is 5 x 5?", answer: "25", user_id: 1)
	end

	describe 'GET #show' do
		before do
      		get :show, :id => 1
    	end
		it 'shows quiz' do
			expect(response).to be_success
      		expect(response).to have_http_status(200) 
		end
	end

	describe 'GET #new' do
		it 'modal shows up' do
			get :new
		end
	end

	describe 'GET #edit' do
		it 'modal shows up containing quiz questions and answers' do
			get :edit, :id => 1
		end
	end

	describe 'POST #create' do
		context 'with valid params' do
			before do
          		post :create, quiz: { question: "What is 5 x 5?", answer: "25", user_id: 1}
        	end

	        it 'redirects to the after_create_question_url' do
                it { expect(response).to be_success }
			    it { expect(flash[:notice]).to eq('Question Created.') }
	          	expect(response).to redirect_to home_path
	        end
		end
	end

	context "Without valid params" do
		before do
          	post :create, qui: { question: nil, :quiz_id => 1}
        end
        it 'redirects back to home' do
			it { expect(flash[:alert]).to eq('Error in creating') }
	        expect(response).to redirect_to home_path
	    end
	end

	describe "DELETE #destroy" do 
		it "deletes the questions" do
		    expect{
		      delete :destroy, id: 1, quiz_id: 1      
		    }.to change(Quiz,:count).by(-1)
		end
		    
		it "redirects to back" do
		    delete :destroy, id: 1, quiz_id: 1
		    expect(response).to redirect_to home_path
	  	end
	end

	describe "PUT #update" do
		before do
			put :update, id: 1, quiz: { quiz_id: 1, question: "What is 10 - 5?" }
		end

		it { expect(response).to redirect_to home_path }
		it { expect(Quiz.find(1).question).to eq "What is 10 - 5?" }
	end

end