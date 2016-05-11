class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # skip_before_action :ensure_login, [:github, :failure]
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
    # if @user.persisted?
    #   sign_in_and_redirect @user
    # else
    #   # session["devise.github_data"] = request.env["omniauth.auth"].except('extra')
    #   redirect_to new_user_session_url
    # end
  end

  def failure
    redirect_to root_path
  end
# end


  # def github
  #   session["dupa"] = request.env['omniauth.auth'].except('extra')
  #   @user = User.first_or_create({ uid: (request.env['omniauth.auth'].uid) })
  #   self.current_user = @user
  #   redirect_to '/'
  # end
  #
  # protected
  #
  # def auth_hash
  #   request.env['omniauth.auth']
  # end
end
