class BoardsController < ApplicationController

  def index
    @posts = []


    issues = Issue.all
    issues.each do |x|
      @posts << x
    end

    notices = Notice.all
    notices.each do |y|
      @posts << y
    end

    @posts = @posts.sort_by {|p| Time.now - p.updated_at}

    render "pages/home"
  end

  private


end
