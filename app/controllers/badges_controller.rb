class BadgesController < ApplicationController
  def index
  	@badges = Badge.all
    respond_to do |format|
      format.js 
    end
  end

  def create
  	@badge = Badge.new(badge_params)
  	if @badge.save
  		flash.now[:success] = "You have created a new badge."
  	else
  		flash.now[:danger] = "You have failed to create a new badge."
  	end
  	@badges = Badge.all
  	respond_to do |format|
      format.js { render "index"} 
    end
  end

  def new
    @badge = Badge.new
    respond_to do |format|
      format.js 
    end
  end

  private
  def badge_params
  	params.require(:badge).permit(:image,:name,:description)
  end
end
