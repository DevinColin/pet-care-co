class ContentsController < ApplicationController

	def index
		@contents = Content.all		
	end
	def show
		@content = Content.find(params[:id])		
	end
	def new
		
	end
	def create
		
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
		params.require(:content).permit(:heading, :text, :avatar)
	end
end
