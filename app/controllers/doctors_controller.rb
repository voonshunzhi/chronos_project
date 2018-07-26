class DoctorsController < ApplicationController
	def show
		@user = Doctor.find(params[:id]).user
		@doctor = current_user.doctor
	end
    
end
