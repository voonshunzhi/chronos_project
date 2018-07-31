require "administrate/field/base"

class NamehrField < Administrate::Field::Base
  def to_s
    self.resource.patient.user.name
  end
end
