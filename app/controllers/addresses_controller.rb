class AddressesController < ApplicationController
  before_action :santa_required

  def show
  end

  def edit
  end

  def update
    address.update!(address_params)
    redirect_to address_path
  end

  private

  def address
    @address ||= santa.address || santa.build_address
  end

  def address_params
    params.require(:address).permit(:name, :line_1, :line_2, :suburb, :postcode, :city, :country)
  end

  helper_method :address
end
