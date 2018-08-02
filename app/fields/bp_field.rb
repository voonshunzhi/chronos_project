require "administrate/field/base"

class BpField < Administrate::Field::Base
  def to_s
      	"#{self.resource.SBP.to_i.floor} / #{self.resource.DBP.to_i.floor} mmHg"
  end
end
