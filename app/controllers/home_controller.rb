class HomeController < ApplicationController
  def signout
    sign_out current_user  # Sign the user out
    redirect_to new_user_session_path
  end
end
