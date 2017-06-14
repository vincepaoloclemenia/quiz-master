class PagesController < ApplicationController
 before_action :authenticate_user!, only: [:home]

  def index
    redirect_to home_path if user_signed_in?
  end

  def home
  
    @newQuiz = Quiz.new
    @quizzes = Quiz.all.where(user_id: current_user.id)
  
    unless !current_user.user_type == "Student"
      
      @users = User.all.where(user_type: "Teacher")
      
    end

  end


    
  
end
