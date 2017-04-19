class PagesController < ApplicationController
  def home
    if user_signed_in?
        @blogs = Blog.all
        @user = current_user.firstname
        render "home"
      else
        render "landing"
      end
  end
end
