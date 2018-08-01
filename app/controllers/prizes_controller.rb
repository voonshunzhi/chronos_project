class PrizesController < ApplicationController
	def index
		@prizes=Prize.all
		@user = current_user
        @patient = @user.patient		
	end

	def deduct_point
		

      	@prizes=Prize.find(params[:id])
		@user = current_user
        @patient = @user.patient
        

        if @patient.points.present?
	        if @patient.points > @prizes.cost

	        	
	        	y= @patient.points- @prizes.cost
	        	

	        	@patient.update(points:y)
            	flash[:success] = "Prize has been redeem!."
            	redirect_to prizes_path
	        else
	        	flash[:danger] = "You don't have enough points."
	        end
	    else
	        flash[:danger] = "You need to have some points."
	        redirect_to prizes_path
    	end

    end
end

