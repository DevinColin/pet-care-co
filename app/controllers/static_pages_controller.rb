class StaticPagesController < ApplicationController

  def home
    @contents = Content.where("page like ?", "%home%")
  end

  def contact
    # gets content and simple forms for contact
    @contents = Content.where("page like ?", "%contact%")
  end

  def admin
    
  end

end
