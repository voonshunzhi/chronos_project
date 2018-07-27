require "administrate/field/base"

class AgeField < Administrate::Field::Base
  def to_s
  	self.resource.user.age
  end
end
