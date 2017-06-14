class QuizzesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :find_question, only: [:update, :edit, :destroy]

    def index
        @quizzes = Quiz.all.where(user_id: current_user.id)
    end

    def new
        @quiz = Quiz.new(quiz_params)
    end

    def show
        @quizzes = Quiz.all.where(user_id: current_user.id)
    end

    def create
        @quiz = Quiz.new(quiz_params)
        @quiz.user_id = current_user.id
        respond_to do |f|
            if @quiz.save
                f.html { redirect_to "", notice: "Question Created"}	
            else
                f.html {  redirect_to "", alert: "Error in creating"}    
            end
        end
    end

    def edit
    end

    def update

        respond_to do |f|
        if @quiz.update(quiz_params)
            f.html { redirect_to "", notice: "Question was updated!"}
        else
            redirect_to root_path
            f.html { redirect_to "", alert: "Error in updating"}
        end
        end

    end

    def destroy

        @quiz.destroy
        redirect_to root_path
        flash[:notice] = "Quiz has been deleted!"

    end


    private
        def quiz_params
            params.require(:quiz).permit(:user_id, :question, :answer)
        end

        def find_question
            @quiz = Quiz.find(params[:id])
        end

        
end
