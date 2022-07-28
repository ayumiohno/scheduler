class BelongsController < ApplicationController
	include SessionsHelper

  def new
  end

	def create
		group = Group.find_by(name: params[:belong][:name]);
		if group && group.authenticate(params[:belong][:password])
			@belong = Belong.new(user_id: current_user.id, group_id: group.id)
			@belong.save
			redirect_to root_path
		else
			flash.now[:danger] = "Invalid name/password combination"
			render 'new'
		end
	end

  def show
  end
end
