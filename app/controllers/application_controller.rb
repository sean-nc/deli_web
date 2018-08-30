class ApplicationController < ActionController::Base

  private
  def is_user?
    unless user_signed_in?
      flash[:notice] = "Please sign in first."
      redirect_to new_user_session_path
    end
  end
end
