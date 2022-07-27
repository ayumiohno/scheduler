module ApplicationHelper
	def full_title(page_title = '')
		base = "Meeting Scheduler"
		if page_title.empty?
			base
		else
			page_title + " | " + base
		end
	end
end
