class HypertensionsController < ApplicationController
	def new
	    @hypertension = Hypertension.new
	    @history = current_user.patient.health_record.hypertensions
	    respond_to do |format|
	        # format.html { redirect_to root_path }
	        format.js
	    end
	end
	
	def create
	    @hypertension = Hypertension.new(hypertension_params)
	    @hypertension.health_record_id = current_user.patient.health_record.id
	    if @hypertension.save
	        flash[:success] = "Record is successfully created."
	    else
	        flash[:danger] = "Record is not created."
	        render "new"
	    end
	    @history = current_user.patient.health_record.hypertensions
	    respond_to do |format|
	        format.js
	    end
	end
	
	private
	def hypertension_params
	    params.require(:hypertension).permit(:medication,:SBP,:DBP,:notes)
	end
end
