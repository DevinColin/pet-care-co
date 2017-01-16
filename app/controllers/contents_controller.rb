class ContentsController < ApplicationController

	def index
		@contents = Content.all		
	end
	def show
		@content = Content.find(params[:id])		
	end
	def new
		
	end
	def create
		
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		@content = Content.find(params[:id])	
		if current_user.admin
			# Throw confirm/warning: are you sure?
			@content.destroy
		else
			# Throw error: not allowed to delete
		end
	end

end
