class PatientsController < ApplicationController
    def index
        #Used to show all the patient
    end
    
    def show
        @user = User.find(params[:id])
        @patient = @user.patient
    end
    
    def edit
        if params[:form] == "user"
            @user = current_user
        elsif params[:form] == "patient"
            @patient = Patient.find_by_user_id(current_user.id)
        end
    end
    
    def update
        if params[:update] == "user"
            current_user.update(update_params)
            flash[:success] = "Update successful."
            redirect_to root_path
        elsif params[:update] == "patient"
            Patient.find_by_user_id(current_user.id).update(update_params)
            flash[:success] = "Update successful."
            redirect_to root_path
        end
    end
    
    private
    def update_params
        if params[:update] == "user"
            params.require(:user).permit(:name,:age,:email,:ic,:gender,:phone)
        elsif params[:update] == "patient"
           params.require(:patient).permit(:height,:weight,:blood_type)
        end
    end
    
end
