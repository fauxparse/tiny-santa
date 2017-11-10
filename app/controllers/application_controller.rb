class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by(twitter_id: session[:current_user])
  end

  def current_user=(user)
    if user.present?
      session[:current_user] = user.twitter_id
    else
      session.delete(:current_user)
    end
  end

  def logged_in?
    current_user.present?
  end

  helper_method :logged_in?, :current_user
end
