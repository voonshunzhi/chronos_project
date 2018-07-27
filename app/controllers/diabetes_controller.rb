class DiabetesController < ApplicationController
	def new
	    @diabete = Diabete.new
	    @history = current_user.patient.health_record.diabetes
	    respond_to do |format|
	        format.js 
	    end
	end
	
	def create
	    @diabete = Diabete.new(diabete_params)
	    @diabete.health_record_id = current_user.patient.health_record.id
	    if @diabete.save
	        flash[:success] = "Record is successfully created."
	    else
	        flash[:danger] = "Record is not created."
	    end
	    @history = current_user.patient.health_record.diabetes
	    respond_to do |format|
	        format.js
	    end

	end
	
	private
	def diabete_params
	    params.require(:diabete).permit(:hg1ac,:medication,:fasting_blood_glucose,:meal,:blood_glucose_level,:notes)
	end
end
