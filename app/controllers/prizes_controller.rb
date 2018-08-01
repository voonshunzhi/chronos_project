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

	        	@patient.prizes << @prizes


            	flash.now[:success] = "Prize has been redeemed!"
                @prizes = current_user.patient.prizes
            	render "show"
	        else
	        	flash[:danger] = "You don't have enough points."
	        	redirect_to prizes_path
	        end
	    else
	        flash[:danger] = "You need to have some points."
	        redirect_to prizes_path
    	end

    end

    def edit
    	@prize = Prize.find(params[:id])
    	respond_to do |format|
    		format.js 
    	end 
    end

    def update
    	@prize = Prize.find(params[:id])
    	if @prize.update(prizes_params)
    		flash.now[:success] = "The prize is updated."
    	else
    		flash.now[:danger] = "The prize fails to update."
    	end
    	@prizes = Prize.all
    	respond_to do |format|
    		format.js 
    	end  
    end

    def show
        @prizes = current_user.patient.prizes
    end
    
    def new
        @prize = Prize.new
        respond_to do |format|
            format.js 
        end 
    end

    def create
        @prize = Prize.new(prizes_params)
        if @prize.save
            flash.now[:success] = "You have created a new prize."
        else
            flash.now[:danger] = "You have failed to create a new prize."
        end
        @prizes = Prize.all
        respond_to do |format|
          format.js 
        end
    end

    private
    def prizes_params
    	params.require(:prize).permit(:name,:description,:image)

    
end
end
