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
		path = page_paths[page_names.find_index(content_params[:page])]
		if !current_user
			redirect_to "/"
		end
		@content.path = path
		@content = Content.create(content_params)
		redirect_to "#{@content.path}"
	end
	def edit
		@content = Content.find(params[:id])		
	end
	def update
		path = page_paths[page_names.find_index(content_params[:page])]
		if !current_user
			redirect_to "/"
		end
		@content = Content.find(params[:id])
		@content.update(content_params)
		redirect_to "#{@content.path}"
	end
	def invisible
		content = Content.find(params[:id])
		content.update(visible: false)
	end
	def visible
		content = Content.find(params[:id])
		content.update(visible: true)
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
		["Home", "About", "Services", "Testimonials", "Contact"]
	end


end
