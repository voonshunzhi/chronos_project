class ObesesController < ApplicationController
    def index
        @patient = Patient.find(params[:id])
        @history = @patient.health_record.obeses
        respond_to do |format|
            format.js { render "create" }
        end
    end

    def new
        # passed in patient.id as a params, to keep track of the patient, instead of current_user.id, to allow doctors to see the histories too.
        @patient = Patient.find(params[:id])
        @obese = Obese.new
        @history = @patient.health_record.obeses
        respond_to do |format|
            format.js
        end
    end
    
    def create
        @patient = Patient.find(params[:id])
        obese = Obese.new(obese_params)
        obese.health_record_id = @patient.health_record.id
        if obese.save
            flash.now[:success] = "Record is successfully created."
            @patient.update(points: @patient.points.to_i + 30)
        else
            flash.now[:danger] = "Record is not created."
        end
        @history = @patient.health_record.obeses
        
        respond_to do |format|
            format.js
        end
    end
    
    def admin_index
        @obeses = Obese.all
        respond_to do |format|
            format.js
        end
    end

    private
    def obese_params
        params.require(:obese).permit(:weight,:height,:waist_circumference,:notes)
    end


end
