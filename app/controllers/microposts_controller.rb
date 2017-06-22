class MicropostsController < ApplicationController
  def index
    @posts = Micropost.all
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params) #micropost_params is the method below

    if @micropost.save
      flash[:notice] = "Post successfully."
      redirect_to root_url
    else
      redirect_to microposts_url
    end
  end

  # This is a necessary step for accepting strong parameters:
  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
