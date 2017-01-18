class TestimonialsController < ApplicationController

	def index
    	@testims = Testimonial.where(visible: true)
	    @contents = Content.where("page like ?", "%testIMOnial%")
	end

	def show
		@testim = Testimonial.find(params[:id])
	end

	def new
		if !current_user
			redirect_to "/testimonials"
		end
		@testim = Testimonial.new
	end

	def create
		if !current_user
			redirect_to "/testimonials"
		end
		@testim = Testimonial.new(testim_params)
		if @testim.save
			redirect_to testimonials_path
		else
			redirect_to "/"
		end
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

	def invisible
		testim = Testimonial.find(params[:id])
		testim.update(visible: false)
	end

	def visible
		testim = Testimonial.find(params[:id])
		testim.update(visible: true)
	end

	def destroy
		@testim = Testimonial.find(params[:id])
		if current_user.admin
			# Throw confirm/warning: are you sure?
			@testim.destroy
			redirect_to admin_path
		else
			# Throw error: not allowed to delete
		end
	end

	private

		def testim_params
			params.require(:testimonial).permit(:cust_name, :cust_desc, :stars, :content, :visible, :avatar)
		end

end
