#Pages controller is to control the index page once they logged in,which is the dashboard
class PagesController < ApplicationController
    def index
        
        #Both the doctor and the patient share the same index page but they see different thing due to the if statement
        if current_user.role == 'doctor'
            doctor = Doctor.find_by_user_id(current_user.id)
            @my_patients = doctor.patients
        else
            @my_doctor = current_user.patient.doctor
        end
    end
end
