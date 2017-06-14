class QuestionsController < ApplicationController
    include QuestionsHelper
    
    before_action :authenticate_user!

    def quizzes
        redirect_to home_path if validate_user current_user
        redirect_to home_path if (User.find(params[:id])).enrolling?(current_user.id)

        @quiz = Quiz.where(user_id: User.find(params[:id]))
        @quizzes = Quiz.all.where(user_id: User.find(params[:id]))
        @answers = Answer.all.where(user_id: current_user.id).where(quiz_id: @quiz)   
    end

    def try_again 
        current_user.answers.where(teacher_id: User.find(params[:id])).destroy_all
        redirect_to questions_path(User.find(params[:id]))
        flash[:notice] = "You may now try answering again"
    end
end

