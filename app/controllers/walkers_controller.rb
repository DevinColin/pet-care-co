class WalkersController < ApplicationController

<<<<<<< HEAD
	def index
		@walkers = Walker.all
	end
	def show
    	@walkers = Walker.where(active: true)
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
		@walker =Walker.find(params[:id])	
		if current_user.admin
			# Throw confirm/warning: are you sure?
			@walker.destroy
		else
			# Throw error: not allowed to delete
		end
	end

end
