class MainController < ApplicationController

  def index
    flash.now[:notice] = "Logged In Successfuly!"
    flash.now[:alert] = "Invalid Email or Password"
  end

end
