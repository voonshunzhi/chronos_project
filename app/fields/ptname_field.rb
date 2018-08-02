require "administrate/field/base"

class PtnameField < Administrate::Field::Base
  def to_s
        self.resource.health_record.patient.user.name
  end
end
