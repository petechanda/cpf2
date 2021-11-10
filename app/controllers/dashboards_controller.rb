class DashboardsController < ApplicationController


	def index
	end

	def show
		@dep = params[:id]
	end

	def edit
		@dep = params[:id]
		@users = User.where(:department1 => @dep)
		@employee = @users.select{|user| user.position=="employee"}
	end

	def time_plan
		@em = User.find(2)
		params.require(:plans).permit(:date, :start_time, :stop_time, :ot, @em)
	end

	def assign_shift
		@assign = Plan.new(time_plan)
		if @assign.save
			#if creation is successful, show up 'successful' message
			flash[:notice] = "successful"
			redirect_to @users
		end
	end
end
