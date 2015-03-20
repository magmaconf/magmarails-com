module ApplicationHelper
	def main_menu
		isRoot? && 'pages/2015/partials/root_main_menu' || 'pages/2015/partials/main_menu'
	end

	def isRoot?
		request.original_fullpath.eql? '/'
	end
end
