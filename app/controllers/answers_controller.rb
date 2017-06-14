class AnswersController < ApplicationController
    include AnswersHelper
    before_action :authenticate_user!
    
    def new
        @answer = Answer.new(answer_params)
        
    end

    def create
        @quiz = Quiz.find(params[:quiz_id])
        @answer = @quiz.answers.create(answer_params)
        @answer.user_id = current_user.id
        @answer.quiz_id = @quiz.id
        @answer.teacher_id = @quiz.user_id 
        respond_to do |f|
            if @answer.save
                @answer.is_correct = false if evaluate_if_blank @answer.ans == nil 
                if (evaluate_if_zero @quiz.answer, @answer.ans) == true || (evaluate_answer @quiz, @answer) == true
                    @answer.is_correct = true
                else
                    @answer.is_correct = false
                end

                @answer.save
            
                f.html { redirect_to questions_path(@quiz.user_id), notice: "Answered successfully"}    
            else  
                f.html { redirect_to :back, alert: "Answer the question first before you proceed"}
                f.json { render json: @answer.errors, status: :unprocessable_entity }
            end
        end
    end

private

    def answer_params
        params.require(:answer).permit(:user_id, :quiz_id, :ans, :teacher_id)
    end

end

