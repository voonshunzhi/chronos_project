class DiabetesController < ApplicationController
	def index
		@patient = Patient.find(params[:id])
        @history = @patient.health_record.diabetes.paginate(:page => params[:page], :per_page => 5)
        respond_to do |format|
            format.js { render "create" }
        end
	end

	def edit
		@diabete_record = Diabete.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@diabete_record = Diabete.find(params[:id])
		if @diabete_record.update(diabete_params)
			flash.now[:success] = "Record is successfully updated."
		else
			flash.now[:danger] = "Record is not updated."
		end
		respond_to do |format|
			
		end
	end

	def new
		# passed in patient.id as a params, to keep track of the patient, instead of current_user.id, to allow doctors to see the histories too.
		@patient = Patient.find(params[:id])
	    @diabete = Diabete.new
		@history = @patient.health_record.diabetes.paginate(:page => params[:page], :per_page => 5)
	    respond_to do |format|
	        format.js 
	    end
	end
	
	def create
		@patient = Patient.find(params[:id])
	    @diabete = Diabete.new(diabete_params)
	    @diabete.health_record_id = @patient.health_record.id
	    if @diabete.save
	        flash.now[:success] = "Record is successfully created."
	        @patient.update(points: @patient.points.to_i + 30)
	    else
	        flash.now[:danger] = "Record is not created."
	    end
	    @history = @patient.health_record.diabetes
	    respond_to do |format|
	        format.js
	    end

	end
	
	def admin_index
		@diabetes = Diabete.all
		respond_to do |format|
			format.js
		end
	end

	private
	def diabete_params
	    params.require(:diabete).permit(:hg1ac,:medication,:fasting_blood_glucose,:meal,:blood_glucose_level,:notes)
	end
end
