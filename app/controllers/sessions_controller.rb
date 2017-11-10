class SessionsController < ApplicationController
  def create
    self.current_user = UserFromOauth.new(auth_hash).user
    redirect_to root_path
  end

  def destroy
    self.current_user = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
