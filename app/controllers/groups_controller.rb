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
		query = "SELECT user_id FROM belongs WHERE group_id = #{@group.id}"
		user_belongs = Belong.find_by_sql(query)
		@user_ids = []
		user_belongs.each do |u_b|
			@user_ids.push(u_b.user_id)
		end
  end

	def detail
		@able_users = params[:able_users]
	end

	private
		def	group_params
			params.require(:group).permit(:name, :password, :password_confirmation)
		end
end
