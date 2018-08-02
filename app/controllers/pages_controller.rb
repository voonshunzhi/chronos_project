#Pages controller is to control the index page once they logged in,which is the dashboard
class PagesController < ApplicationController
    def index
        @badge = Badge.all[0]
       #Both the doctor and the patient will redirect to different doctor_path, and patient_path, which are show action in respective controllers
        if current_user.role == 'doctor'
            redirect_to admin_patients_path
        elsif current_user.role == 'patient'
            patient = Patient.find_by_user_id(current_user.id)
            redirect_to patient_path(patient.id)
        elsif current_user.role == 'admin'
            redirect_to superadmin_path
        else
            Console.log("user.role not detected")
            redirect_to root_path
        end
    end
end
