class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		user = User.find(params[:enrolled_id])
		current_user.enroll(user)
		redirect_to(:back)
	end

end