class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@microposts = @user.microposts.paginate(page: params[:page])
    #if @user.id != current_user.id
     # render 'show'
    #else
     # render 'profile'
    #end
  end

  def create
    @user = User.new(user_params)    # Strong paramter
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the LinkedOut!"
      redirect_to users_path
      #render 'profile'
    else
      render 'new'
    end
  end

  def new
  	@user = User.new
  end

  def index
    @users = User.all
    render 'dashboard'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'show'
    end
  end

  def action
    render 'action'
  end

 private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :isCandidate, :phone, :address)
    end
end
