class ServicesController < ApplicationController

  def index
    @services = Service.all
    # this ative record search proves that the user can put in the page
    # name without pluralization or capitalization and it still produces
    # the desired result for our end user.
    @contents = Content.where("page like ?", "%seRVice%")
  end

end
