class PatientsController < ApplicationController
    def index
        #Used to show all the patient
        @patients = Patient.all
        @patients = @patients.reject { |p| p.user.role == 'admin'}
        respond_to do |format|
          format.js
        end 
    end
    
    def show
        @user = Patient.find(params[:id]).user
        @patient = @user.patient
        if @patient.level == "level basic"
            @badge = Badge.all[0]
        elsif @patient.level == "level 1"
            @badge = Badge.all[1]
        elsif @patient.level == "level 2"
            @badge = Badge.all[2]
        elsif @patient.level == "level 3"
            @badge = Badge.all[3]
        elsif @patient.level == "level 4"
            @badge = Badge.all[4]
        elsif @patient.level == "level 5"
            @badge = Badge.all[5]
        end
    end
    
    def edit
        if params[:form] == "user"
            @user = current_user
        elsif params[:form] == "patient"
            @patient = current_user.patient
        end
    end
    
    def update
        if params[:update] == "user"
            current_user.update(update_params)
            flash[:success] = "Update successful."
            redirect_to patient_path(current_user.patient.id)
        elsif params[:update] == "patient"
            patient = Patient.find_by_user_id(params[:id])
            patient.update(update_params)
            flash[:success] = "Update successful."
            redirect_to patient_path(patient.id)
        end
    end
    
    private
    def update_params
        if params[:update] == "user"
            params.require(:user).permit(:name,:age,:email,:ic,:gender,:phone,:avatar)
        elsif params[:update] == "patient"
           params.require(:patient).permit(:height,:weight,:blood_type)
        end
    end
    
end
