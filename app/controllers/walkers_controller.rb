class WalkersController < ApplicationController

	def index
		@walkers = Walker.all
		if current_user
	    	@contents = Content.where(page: "About")
		else
	    	@contents = Content.where(page: "About").reject { |c| !c.visible }[0..2]
		end
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

	def create
		if !current_user
			redirect_to "/walkers"
		end
		@walker = Walker.create(walker_params)
		redirect_to "/walkers"
	end

	def edit
		if !current_user
			redirect_to "/walkers"
		end
		@walker = Walker.find(params[:id])
	end

 	def update
 		if !current_user
 			redirect_to "/walkers"
 		end
 		walker = Walker.find(params[:id])
 		walker.update(walker_params)
 		walker.save
 		redirect_to admin_path
 	end

 	def deactivate
 		walker = Walker.find(params[:id])
 		walker.update(active: false)
 	end

 	def activate
 		walker = Walker.find(params[:id])
 		walker.update(active: true)
 	end

	def destroy
		@walker = Walker.find(params[:id])
		if current_user.admin
			@walker.destroy
			redirect_to admin_path
		else
			flash[:alert] = "Error: Admin function only"
			redirect_to admin_path
		end
	end

	private

		def walker_params
			params.require(:walker).permit(:id, :fname, :lname, :role, :active, :role, :avatar)
		end

end
