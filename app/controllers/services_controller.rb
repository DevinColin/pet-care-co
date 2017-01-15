class ServicesController < ApplicationController

	def index
		@services = Service.all
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
