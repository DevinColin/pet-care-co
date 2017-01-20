class ContentsController < ApplicationController

	def index
		@contents = Content.all		
	end
	def show
		@content = Content.find(params[:id])		
	end
	def new
		if !current_user
			redirect_to "/"
		end
		@content = Content.new
	end
	def create
puts "++++++++++++++++++++++++++++++++++"
puts params[:page]
puts page_names.find_index(params[:page])
params.each do |k, v|
	print k
	print ", "
	puts v
end
puts "++++++++++++++++++++++++++++++++++"
puts "now the strong params"
puts "++++++++++++++++++++++++++++++++++"
content_params.each do |k, v|
	print k
	print ", "
	puts v
end
puts "++++++++++++++++++++++++++++++++++"
		path = page_paths[page_names.find_index(content_params[:page])]
		if !current_user
			redirect_to "/"
		end
		@content = Content.create(content_params)
		@content.path = path
		redirect_to "#{@content.path}"
	end
	def edit
		@content = Content.find(params[:id])		
	end
	def update
		@content = Content.find(params[:id])
		@content.update(content_params)
		redirect_to "#{@content.path}"
	end
	def destroy

	end

	private

	def content_params
		params.require(:content).permit(:page, :heading, :text, :avatar, :visible)
	end
	def page_paths
		["/", "/walkers", "/services", "/testimonials", "/contact"]
	end
	def page_names
		["Home", "About (walkers index)", "Services", "Testimonials", "Contact"]
	end


end
