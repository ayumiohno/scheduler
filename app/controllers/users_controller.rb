class UsersController < ApplicationController

	include SessionsHelper

	before_action :logged_in_user, only: [:show]

	def show
		@user = User.find(params[:id])
		query = "SELECT group_id FROM belongs WHERE user_id = #{@user.id}"
		@group_ids = Belong.find_by_sql(query)
	end

  def new
		@user = User.new
  end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to Meeting Scheduler"
			log_in @user
			redirect_to @user
		else
			render 'new'
		end
	end



	private

		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation)
		end

		def correct_user
				@user = User.find(params[:id])
				redirect_to root_path unless current_user?(@user)
		end


end
