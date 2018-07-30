class DoctorsController < ApplicationController
	def show
		@user = Doctor.find(params[:id]).user
		@doctor = current_user.doctor
	end
    
    def index
    	@doctors = Doctor.all
	    respond_to do |format|
	      format.js
	    end 
    end
end
