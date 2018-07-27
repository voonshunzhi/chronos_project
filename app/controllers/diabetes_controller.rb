class DiabetesController < ApplicationController
	def index
		 patient = Patient.find(params[:id])
        @history = patient.health_record.diabetes
        respond_to do |format|
            format.js { render "create" }
        end
	end

	def new
		# passed in patient.id as a params, to keep track of the patient, instead of current_user.id, to allow doctors to see the histories too.
		@patient = Patient.find(params[:id])
	    @diabete = Diabete.new
		@history = @patient.health_record.diabetes
	    respond_to do |format|
	        format.js 
	    end
	end
	
	def create
		patient = Patient.find(params[:id])
	    @diabete = Diabete.new(diabete_params)
	    @diabete.health_record_id = patient.health_record.id
	    if @diabete.save
	        flash[:success] = "Record is successfully created."
	    else
	        flash[:danger] = "Record is not created."
	    end
	    @history = patient.health_record.diabetes
	    respond_to do |format|
	        format.js
	    end

	end
	
	private
	def diabete_params
	    params.require(:diabete).permit(:hg1ac,:medication,:fasting_blood_glucose,:meal,:blood_glucose_level,:notes)
	end
end
