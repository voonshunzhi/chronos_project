class HypertensionsController < ApplicationController
	def index
		patient = Patient.find(params[:id])
	    @history = patient.health_record.hypertensions
	    respond_to do |format|
	        format.js { render "create" }
	    end
	end

	def new
		# passed in patient.id as a params, to keep track of the patient, instead of current_user.id, to allow doctors to see the histories too.
		@patient = Patient.find(params[:id])
	    @hypertension = Hypertension.new
		@history = @patient.health_record.hypertensions
	    respond_to do |format|
	        # format.html { redirect_to root_path }
	        format.js
	    end
	end
	
	def create
		patient = Patient.find(params[:id])
	    @hypertension = Hypertension.new(hypertension_params)
	    @hypertension.health_record_id = patient.health_record.id
	    if @hypertension.save
	        flash[:success] = "Record is successfully created."
	    else
	        flash[:danger] = "Record is not created."
	        render "new"
	    end
	    @history = patient.health_record.hypertensions
	    respond_to do |format|
	        format.js
	    end
	end
	
	private
	def hypertension_params
	    params.require(:hypertension).permit(:medication,:SBP,:DBP,:notes)
	end
end
