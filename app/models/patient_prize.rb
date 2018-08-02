class PatientPrize < ApplicationRecord
  belongs_to :patient
  belongs_to :prize
end
