class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

	def create
		user = User.find_by(name: params[:session][:name]);
		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to user
		else
			flash.now[:danger] = "Invalid name/password combination"
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end

end