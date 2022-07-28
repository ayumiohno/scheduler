class BrankdaysController < ApplicationController

	include SessionsHelper

  def show
  end

  def new
  end

	def create
		for week in 1..7 do
			for time in 1..5 do
				if params[:register][:"#{week}_#{time}"] == "1"
					@brankdays = Brankdays.new(day_id: week, time_id: time, user_id: current_user.id)
					@brankdays.save
				end
			end
		end
	end
end
