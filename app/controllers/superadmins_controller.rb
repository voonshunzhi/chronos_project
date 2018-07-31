class SuperadminsController < ApplicationController
  def index
  end

  def all_users
  	@patients = Patient.all.count
  	@doctors = Doctor.all.count
  	@ary = [@patients,@doctors] 
  	respond_to do |format|
  		format.json { render json:@ary}
  	end
  end

  def all_active_patients
  	@range = 7.days.ago.to_date.upto(Time.now.to_date).to_a
  	@arr = @range.collect do |date|
  		[date,Obese.created_at(date).count,Diabete.created_at(date).count,
  		Hypertension.created_at(date).count]
  	end
  	respond_to do |format|
  		format.json { render json:@arr}
  	end
  end

end
