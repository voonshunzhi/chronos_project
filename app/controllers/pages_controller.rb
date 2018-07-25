class PagesController < ApplicationController
    def index
        if current_user.role == 'doctor'
            doctor = Doctor.find_by_user_id(current_user.id)
            @my_patients = doctor.patients
        else
            @my_doctor = current_user.patient.doctor
        end
    end
end
