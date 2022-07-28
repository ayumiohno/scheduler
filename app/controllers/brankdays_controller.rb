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
					query = "SELECT COUNT(*) AS count_check FROM brankdays WHERE day_id = #{week} 
										AND time_id = #{time} AND user_id = #{current_user.id}"
					if Brankdays.find_by_sql(query).first.count_check == 0
						@brankdays = Brankdays.new(day_id: week, time_id: time, user_id: current_user.id)
						@brankdays.save
					end
				else
					query = "DELETE FROM brankdays WHERE day_id = #{week} 
										AND time_id = #{time} AND user_id = #{current_user.id}"
					ActiveRecord::Base.connection.execute(query)
				end
			end
		end
		redirect_to current_user
	end
end
