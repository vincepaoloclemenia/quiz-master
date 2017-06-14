module QuestionsHelper

    def validate_user user
        
        if user.user_type == "Teacher"
            return true
        else
            return false
        end

    end


end
