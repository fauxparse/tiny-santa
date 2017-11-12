class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by(uid: session[:current_user])
  end

  def current_user=(user)
    if user.present?
      session[:current_user] = user.uid
    else
      session.delete(:current_user)
    end
  end

  def logged_in?
    current_user.present?
  end

  def christmas
    @christmas ||= Christmas.present
  end

  def santa
    christmas&.santas&.where(user_id: current_user&.id)&.first
  end

  helper_method :logged_in?, :current_user, :christmas, :santa
end
