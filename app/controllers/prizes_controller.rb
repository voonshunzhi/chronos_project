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
        

        if @patient.points > @prizes.cost

        	
        	y= @patient.points- @prizes.cost
        	p y
        else
        	p error 
        end

        

    end
end
