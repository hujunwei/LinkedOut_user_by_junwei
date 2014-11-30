class ApplicationsController < ApplicationController
  def new 
  end

  def index
    puts "Hi!"
    @pppid
    @pppid = params[:my_position_id]
    unless @pppid.nil?
      @new_application = Application.new(application_status: "pending", update_date: "XXX", user_id: current_user.id, position_id: @pppid)
      @new_application.save
    end

    @new_status
    @new_status = params[:new_status]
    unless @new_status.nil?
      @old_application = Application.find(params[:change_id])
      @new_update_date = @old_application.update_date
      @new_pos_id = @old_application.position_id
      @new_usr_id = @old_application.user_id
      #
      @update_application = Application.new(application_status: @new_status, update_date: @new_update_date, user_id: @new_usr_id, position_id: @new_pos_id)
      @update_application.save
    end

    @applications_all = Application.find(current_user.id)
  end

  def show
    @application = Application.find(params[:id])
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    redirect_to applications_path
  end

  def create
    @pppid
    @pppid = params[:my_position_id]
    unless @pppid.nil?
      @application = Application.new(application_status: "pending", update_date: "XXX", user_id: current_user.id, position_id: @pppid)
      puts "Hi!"
      if @application.save
        redirect_to users_action_viewApp_path
      else
        render 'new'
      end
    end

    @new_status
    @new_status = params[:status]
    unless @new_status.nil?
      @old_application = Application.find(params[:application_id])
      @new_update_date = @old_application.update_date
      @new_pos_id = @old_application.position_id
      @new_usr_id = @old_application.user_id
      #
      @update_application = Application.new(application_status: @new_status, update_date: @new_update_date, user_id: @new_usr_id, position_id: @new_pos_id)
      if @update_application.save
        redirect_to users_action_viewApp_path + '?position_id=' + params[:position_id]
      else
        render 'new'
      end
    end
  end

  private
    def application_params
      params.require(:application).permit(:application_status, :update_date, :user_id, :position_id)
    end
end
