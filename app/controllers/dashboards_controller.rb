class DashboardsController < ApplicationController


	def index
	end

	def show
		@dep = params[:id]
	end

	def time_plan
		@assign_time = params[:emp]
		@uID_list = params[:select_user]
		#puts @uID_list.class
		if @uID_list
		@uID_list.each do |uID|
			user = User.find(uID.to_i)
			@assign = user.plans.new(@assign_time)
			#@assign_time[:user_id] = uID.to_i
			#puts @assign_time
			#puts ""
			@assign = Plan.new(@assign_time)
		end
		end
	end

	def edit
		@dep = params[:id]
		@users = User.where(:department1 => @dep)
		@employee = @users.select{|user| user.position=="employee"}

		@assign_time = params[:emp]
		@uID_list = params[:select_user]
		#puts @uID_list.class
		if @uID_list
		@uID_list.each do |uID|
			user = User.find(uID.to_i)
			#@assign = user.Plan.new(@assign_time)
			@assign_time[:user_id] = uID.to_i
			puts @assign_time
			puts ""
			#@assign = Plan.new(@assign_time)
		end
		end

		#if @assign.save
			#if creation is successful, show up 'successful' message
		#	flash[:notice] = "successful"
		#	redirect_to edit_dashboard_path(@dep)
		#else
			#render 'edit'
		#end
		
	end
end
