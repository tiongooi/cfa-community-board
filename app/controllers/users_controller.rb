class UsersController < ApplicationController
  def add_postcode
    @user = current_user
    @user.location = params[:postcode][:location]
    @user.state = params[:postcode][:state]
    @user.postcode = params[:postcode][:postcode]
    @user.save
      if Time.now - current_user.created_at < 2.minute
        redirect_to edit_user_registration_path
      else
        redirect_to root_path
      end
  end

end
