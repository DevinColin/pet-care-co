class TestimonialsController < ApplicationController

	def index
    	@testims = Testimonial.where(visible: true)
	    @contents = Content.where("page like ?", "%testIMOnial%")    	
	end
	def show

	end
	def new
		if !current_user
			redirect_to "/testimonials"
		end
		@testim = Tesimonial.new
	end
	def create
		if !current_user
			redirect_to "/testimonials"
		end
		@testim = Testimonial.create(testim_params)		
		redirect_to "/testimonials"
	end
	def edit
		if !current_user
			redirect_to "/testimonials"
		end
		@testim = Testimonial.find(params[:id])
	end
	def update
		if !current_user
			redirect_to "/testimonials"
		end
		testim = Testimonial.find(params[:id])
		testim.update(testim_params)
		redirect_to "/testimonials"
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

	private

	def testim_params
		params.require(:testimonial).permit(:cust_name, :cust_desc, :stars, :content, :visible, :avatar)
	end

end
