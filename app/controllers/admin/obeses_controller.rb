module Admin
  class ObesesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Obese.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Obese.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    def scoped_resource
      doctor =   current_user.doctor
      ids = (doctor.patients.collect {|pt| pt.health_record.obeses.ids}).flatten
      resource_class.where(id: ids)
    end
  end
end
