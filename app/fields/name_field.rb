require "administrate/field/base"

class NameField < Administrate::Field::Base
  def to_s
  	self.resource.user.name
  end
end
