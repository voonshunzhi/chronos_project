require "administrate/field/base"

class PticField < Administrate::Field::Base
  def to_s
  	self.resource.user.ic
  end
end
