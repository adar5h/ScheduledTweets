class RegistrationController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # params
    # {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
    # params[:user]
    # {"email"=>"", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account!"
    else
      render :new # If not saved in the db, the views/registration/new.html.erb will be rendered
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
    # same as params[:user], just that .require will raise an error if not passed the argument.
  end

end
