class PatientsController < ApplicationController
    def index
        #Used to show all the patient
    end
    
    def show
        @user = Patient.find(params[:id]).user
        @patient = @user.patient
    end
    
    def edit
        if params[:form] == "user"
            @user = current_user
        elsif params[:form] == "patient"
            @patient = Patient.find_by_user_id(params[:id])
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
