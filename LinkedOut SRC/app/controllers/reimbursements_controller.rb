class ReimbursementsController < ApplicationController
    def new
    end

    def create
    	@reimbursement = Reimbursement.new(reimbursement_params)
 		@reimbursement.reimburse_status = 'unpaid'
  		@reimbursement.save
  		redirect_to "/reimbursements/show?user_id=" + params[:reimbursement][:user_id] + "&position_id=" + params[:reimbursement][:position_id]
	end

	def show
  		@reimbursements = Reimbursement.where("user_id = ? AND position_id = ?", params[:user_id], params[:position_id])
	end

	def edit
  		@reimbursements = Reimbursement.where("user_id = ? AND position_id = ?", params[:user_id], params[:position_id])
	end

	def update
  		@reimbursement = Reimbursement.find(params[:id])

  		@reimbursement.update(reimbursement_params)
    	redirect_to "/reimbursements/edit?user_id=" + @reimbursement.user_id.to_s + "&position_id=" + @reimbursement.position_id.to_s
  	end

    private
  		def reimbursement_params
    		params.require(:reimbursement).permit(:position_id, :user_id, :item, :money, :reimburse_status)
  		end

end
