module Admin
  class DiabetesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Diabete.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Diabete.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def scoped_resource
      doctor =   current_user.doctor
      ids = (doctor.patients.collect {|pt| pt.health_record.diabetes.ids}).flatten
      resource_class.where(id: ids)
    end
  end
end
