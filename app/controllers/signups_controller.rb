class SignupsController < ApplicationController
  before_action :login_required

  def new
    redirect_to root_path, notice: 'You’re already signed up!' if santa
  end

  def create
    signup.attributes = signup_params
    if signup.save
      redirect_to root_path, notice: 'You’re all signed up!'
    else
      render :new
    end
  end

  private

  def signup
    @signup ||= SignupForm.new(user: current_user, christmas: christmas)
  end

  def signup_params
    params.require(:signup).permit(:conditions, candidate_uids: [])
  end

  helper_method :signup
end
