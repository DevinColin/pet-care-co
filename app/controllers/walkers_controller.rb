class WalkersController < ApplicationController

  def index
    @walkers = Walker.where(active: true)
  end
end
