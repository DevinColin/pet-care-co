class ServicesController < ApplicationController

	def index
	    @services = Service.all
	    # this ative record search proves that the user can put in the page
	    # name without pluralization or capitalization and it still produces
	    # the desired result for our end user.
	    @contents = Content.where("page like ?", "%seRVice%")
	end
	def show
		@service = Service.find(params[:id])		
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
		@service = Service.find(params[:id])	
		if current_user.admin
			# Throw confirm/warning: are you sure?
			@service.destroy
		else
			# Throw error: not allowed to delete
		end
	end

end
