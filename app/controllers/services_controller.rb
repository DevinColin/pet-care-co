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
		if !current_user
			redirect_to "/services"
		end
		@service = Service.new
	end
	def create
		if !current_user
			redirect_to "/services"
		end
		@service = Service.create(service_params)
		redirect_to "/services"
	end
	def edit
		if !current_user
			redirect_to "/services"
		end
		@service = Service.find(params[:id])
	end
	def update
		if !current_user
			redirect_to "/services"
		end
		service = Service.find(params[:id])
		service.update(service_params)
		redirect_to "/services"
	end

	def destroy
		@service = Service.find(params[:id])
		if current_user.admin
			# Throw confirm/warning: are you sure?
			@service.destroy
			redirect_to '/admin'
		else
			# Throw error: not allowed to delete
		end
	end

	private

	def service_params
		params.require(:service).permit(:name, :highlights, :description, :avatar)
	end

end
