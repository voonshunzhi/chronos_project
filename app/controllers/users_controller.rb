#User controller control user signup
class UsersController < Clearance::UsersController
  before_action :is_doctor?, only: [:create]
  
  def index
    @users = User.all
    @users = @users.reject { |p| p.role == 'admin'}
    respond_to do |format|
      format.js
    end 
  end

  def new
    @user = User.new
  end
  
  def create
      if params[:sign_up] == 'doctor'
        @user = User.new(user_params[:info])
        @user.role = 1
        if @user.save
          Doctor.create(user_id:@user.id)
          sign_in @user
          redirect_back_or url_after_create
        else
          render template: "users/new"
        end
      else
        if Doctor.found_doctor?(@verification_code)
            @user = User.new(user_params[:info])
            if @user.save
              @patient = Patient.create(user:@user,doctor: Doctor.doctor_found(@verification_code))
              @health_record = HealthRecord.create(patient:@patient)
              sign_in @user
              redirect_back_or url_after_create
            else
              render template: "users/new"
            end
        else
          flash.now[:danger] = "Incorrect verification code."
          render 'new'
        end
      end 
  end
  
  private
  
  def user_params
     params.require(:user).permit(info: [:email,:password,:name,:age,:ic,:gender,:phone],verification:[:vcode])
  end
  
  def got_verification_code?
    @verification_code = user_params[:verification][:vcode]
    if @verification_code.blank?
      flash[:danger] = "Please enter your verification code."
      redirect_to sign_up_path
    end
  end
  
  def is_doctor?
    unless params[:sign_up] == "doctor"
      got_verification_code?
    end
  end
end
