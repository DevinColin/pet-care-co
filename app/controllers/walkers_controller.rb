class WalkersController < ApplicationController

	def index
		@walkers = Walker.all
	    @contents = Content.where("page like ?", "%about%")
	end
	
	def show
    	@walkers = Walker.where(active: true)
	end

	def new
		if !current_user
			redirect_to "/walkers"
		end
		@walker = Walker.new
	end

	def edit
		if !current_user
			redirect_to "/walkers"
		end
		@walker = Walker.find(params[:id])
	end

	def create
		if !current_user
			redirect_to "/walkers"
		end
		@walker = Walker.create(walker_params)
		redirect_to "/walkers"
	end

	def update
		if !current_user
			redirect_to "/walkers"
		end
		walker = Walker.find(params[:id])
		walker.update(walker_params)
		walker.save
		redirect_to "/walkers"
	end

	def destroy
		@walker = Walker.find(params[:id])
		if current_user
			@walker.destroy
			redirect_to '/admin'
		else
			# error handling if the user doesn't destroy
		end
	end

	private

		def walker_params
			params.require(:walker).permit(:id, :fname, :lname, :role, :active, :role, :avatar)
		end

end
