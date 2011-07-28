module ApplicationHelper
	def title
		base_title = 'D2shed'
		if @title.nil?
			base_title
		else
			"#{@title} | #{base_title}"
		end		
	end
end