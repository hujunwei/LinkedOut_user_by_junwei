class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)    # Strong paramter
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the LinkedOut!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def new
  	@user = User.new

  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
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
    @positions = Position.all
    render 'action'
    #redirect_to applications_path
  end

  def viewJobs
    if current_user == nil
      redirect_to '/signin'
    end
    @user = current_user
    @positions = @user.positions
    @positions = @positions.sort {|a,b| b.post_date <=> a.post_date}
  end

  def viewApp
    if current_user == nil
      redirect_to '/signin'
    end
    @user = current_user

    # logic for company
    if current_user.isCandidate == 'company'
      @position = Position.find(params[:position_id])
      app_table = Hash.new
      @position.applications.each do |application|  # start of iteration
      if app_table[application.user_id] == nil
        # user_name|apply_date|updated_at|deadline|status|user_id|reimbursement|application_id
        app = [application.user.name, application.updated_at, application.updated_at, @position.deadline, application.application_status, application.user_id, 0, application.id.to_s]
        app_table[application.user_id] = app
      else
        app = app_table[application.user_id]
        if application.application_status == 'Pending'
          app[1] = application.updated_at
        end
        if application.updated_at > app[2]
          app[2] = application.updated_at
          app[4] = application.application_status
        end
        if application.application_status == 'On-site'
          app[6] = 1
        end
      end
      end  # end of iteration

      @apps = app_table.values;
      if @apps == nil
        @apps = Array.new
      else
        @apps = @apps.sort {|a,b| b[1] <=> a[1]}
      end

      return
    end

    # logic for candidate
    app_table = Hash.new
    @user.applications.each do |application|
      if app_table[application.position_id] == nil
        # position_name|company_name|apply_date|updated_at|status|reimbursement|position_id
        if application.position.nil?
          next
        end
        app = [application.position.name, application.position.user.name, application.updated_at, application.updated_at, application.application_status, 0, application.position.id]
        app_table[application.position_id] = app
      else
        app = app_table[application.position_id]
        if application.application_status == 'Pending'
          app[2] = application.updated_at
        end
        if application.updated_at > app[3]
          app[3] = application.updated_at
          app[4] = application.application_status
        end
        if application.application_status == 'On-site'
          app[5] = 1
        end
      end
    end

    @apps = app_table.values;
    if @apps == nil
      @apps = Array.new
    else
      @apps = @apps.sort {|a,b| b[2] <=> a[2]}
    end
  end

 private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :isCandidate, :phone, :address)
    end
end
