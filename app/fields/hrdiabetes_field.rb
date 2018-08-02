require "administrate/field/base"

class HrdiabetesField < Administrate::Field::Base
  def to_s
  	"#{self.resource.diabetes.count} #{'Record'.pluralize(self.resource.diabetes.count)}"
  end
end
