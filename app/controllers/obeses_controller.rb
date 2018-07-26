class ObesesController < ApplicationController
    
    def new
        @obese = Obese.new
        @history = current_user.patient.health_record.obeses
        respond_to do |format|
            format.js 
        end
    end
    
    def create
        @obese = Obese.new(obese_params)
        @obese.health_record_id = current_user.patient.health_record.id
        if @obese.save
            flash[:success] = "Record is successfully created."
        else
            flash[:danger] = "Record is not created."
            render "new"
        end
    end
    
    private
    def obese_params
        params.require(:obese).permit(:weight,:height,:waist_circumference,:notes)
    end
end
