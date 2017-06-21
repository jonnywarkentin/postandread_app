class MicropostsController < ApplicationController
  def index
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new

    if @micropost.save
      flash[:notice] = "Post successfully."
      redirect_to root_url
    else
      render :action => "index"
    end
  end
end
