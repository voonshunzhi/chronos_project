require "administrate/field/base"

class HrobeseField < Administrate::Field::Base
  def to_s
  	"#{self.resource.obeses.count} #{'Record'.pluralize(self.resource.obeses.count)}"
  end
end
