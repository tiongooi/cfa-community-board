class PagesController < ApplicationController
  def home
    if user_signed_in?
        redirect_to boards_path
      else
        render "landing"
      end
  end
end
