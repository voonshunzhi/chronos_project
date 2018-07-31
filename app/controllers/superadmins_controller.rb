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

  def all_points
    @rs = [
      ["0 to 100",Patient.where(points:0...100).count],
      ["100 to 1000",Patient.where(points:100...1000).count],
      ["1000 to 3000",Patient.where(points:1000...3000).count],
      ["Above 3000",Patient.where("points > ?",3000).count]
    ]
    respond_to do |format|
      format.json { render json:@rs}
    end
  end

end
