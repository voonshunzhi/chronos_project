require "administrate/field/base"

class Hba1cField < Administrate::Field::Base
  def to_s
    self.resource.hg1ac
  end
end
