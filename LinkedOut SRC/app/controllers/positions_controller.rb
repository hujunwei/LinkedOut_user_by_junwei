class PositionsController < ApplicationController
  def new
    @position = Position.new
  end

  def index
    #@positions_all = Position.find_by user_id: current_user.id
    @positions_all = Position.where(user_id: current_user.id)
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
    
    if @position.update(position_params)
      redirect_to users_action_viewJobs_path
    else
      render 'edit'
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    redirect_to positions_path
  end

  def show
    @position = Position.find(params[:id])
  end

  def create
    @position = Position.new(position_params)
    @position.user_id = current_user.id
    if @position.save
      redirect_to users_action_viewJobs_path
    else
      render 'new'
    end
  end

  private
    def position_params
      params.require(:position).permit(:name, :post_date, :deadline, :location, :pos_type, :level, :position_status, :description)
    end
end
