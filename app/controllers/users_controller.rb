class UsersController < ApplicationController
  def update
    @user = current_user
    pass = params[:user][:password]
    if @user.update({password: pass, password_confirmation: pass})
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
    else
      render "edit"
    end
    respond_to do |format|
      format.html {redirect_to edit_user_registration_path}
    end
  end
  private
  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end
end
