class WalkersController < ApplicationController

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
		@walker = Walker.find(params[:id])
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

	private

	def walker_params
		
	end

end
