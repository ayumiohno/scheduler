class GroupsController < ApplicationController

	include SessionsHelper

  def new
		@group = Group.new
  end

	def create
		@group = Group.new(group_params)
		if @group.save
			@belong = Belong.new(user_id: current_user.id, group_id: @group.id)
			@belong.save
			redirect_to root_path
		else
			render 'new'
		end
		
	end

  def show
		@group = Group.find(params[:id])
		query = "SELECT user_id FROM belongs WHERE group_id == #{@group.id}"
		@user_ids = Belong.find_by_sql(query)
  end

	private
		def	group_params
			params.require(:group).permit(:name, :password, :password_confirmation)
		end
end
