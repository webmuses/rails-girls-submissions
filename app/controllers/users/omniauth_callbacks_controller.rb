class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.from_omniauth!(request.env["omniauth.auth"])
    if @user.user_allowed?
      sign_in_and_redirect @user
    else
      redirect_to root_path, notice: 'You are not allowed to see submissions for Rails Girls'
    end
  end

  def failure
    redirect_to root_path
  end
end
