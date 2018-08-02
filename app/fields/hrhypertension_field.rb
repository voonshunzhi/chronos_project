require "administrate/field/base"

class HrhypertensionField < Administrate::Field::Base
  def to_s
  	"#{self.resource.hypertensions.count} #{'Record'.pluralize(self.resource.hypertensions.count)}"
  end
end
