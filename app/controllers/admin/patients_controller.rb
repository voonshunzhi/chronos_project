module Admin
  class PatientsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index     
    #   @resources = Patient.where(doctor_id: current_user.id).
    #     page(params[:page]).
    #     per(10)
    #     super
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Patient.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def scoped_resource
     resource_class.where(doctor_id: current_user.id)
    end
    
    def valid_action?(name, resource = resource_class)
      %w[edit destroy].exclude?(name.to_s) && super
    end

  end
end
