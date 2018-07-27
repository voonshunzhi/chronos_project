#Pages controller is to control the index page once they logged in,which is the dashboard
class PagesController < ApplicationController
    def index
       #Both the doctor and the patient will redirect to different doctor_path, and patient_path, which are show action in respective controllers
        if current_user.role == 'doctor'
            doctor = Doctor.find_by_user_id(current_user.id)
            redirect_to doctor_path(doctor.id)

        elsif current_user.role == 'patient'

            patient = Patient.find_by_user_id(current_user.id)
            redirect_to patient_path(patient.id)

        # admin signup has not been completed yet
        # elsif current_user.role == 'admin'    
        #     admin = Admin.find_by_user_id(current_user.id)
        #     redirect_to doctor_path(doctor.id)

        else
            Console.log("user.role not detected")
            redirect_to root_path
        end

        #     @my_doctor = current_user.patient.doctor
        #     @obese = current_user.patient.health_record.obeses.first
        #     @diabete = current_user.patient.health_record.diabetes.first
        #     @hypertension = current_user.patient.health_record.hypertensions.first
        # end
    end


end
