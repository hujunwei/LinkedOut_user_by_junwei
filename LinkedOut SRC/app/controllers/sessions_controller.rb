class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      #redirect_to user
      redirect_to users_path
    else
      flash.now[:error] = '**Invalid email/password combination, please valid your email/password combination!**'
      render 'new'
    end
  end

  def destroy
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    self.current_user = nil
    cookies.delete(:remember_token)
    render 'new'
  end


end
