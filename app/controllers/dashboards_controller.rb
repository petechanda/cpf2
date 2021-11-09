class DashboardsController < ApplicationController


	def index
	end

	def show
		@pa = params[:id]
	end

	def edit
		@pa = params[:id]
		@users = User.where(:department1 => @pa)
		@employee = @users.select{|user| user.position=="employee"}
	end
	#def time_plan
	#	params.require(:user).permit(:
	#end
	
end
