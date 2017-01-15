class TestimonialsController < ApplicationController

	def index
		@testims = Testimonial.all
	end
	def show
		@testim = Testimonial.find(params[:id])		
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
		@testim = Testimonial.find(params[:id])	
		if current_user.admin
			# Throw confirm/warning: are you sure?
			@testim.destroy
		else
			# Throw error: not allowed to delete
		end
	end

end
