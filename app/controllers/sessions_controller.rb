class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    # Same as wrting find_by(:email Iadarshh@gmail.com)
    if @user.present? && @user.authenticate(params[:password]) #Authenticate method comes from the has_secure_password
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged In Successfully"
    else
      flash[:alert] = "Invalid email or password!"
      render :new
    end

  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
