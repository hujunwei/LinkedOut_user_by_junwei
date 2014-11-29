class StaticPagesController < ApplicationController

  def home
    @micropost = current_user.microposts.build if signed_in?
    @application = Application.find(2)
  end
end
