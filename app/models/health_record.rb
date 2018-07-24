class HealthRecord < ApplicationRecord
	has_many :hypertensions
	has_many :obeses
	has_many :diabetesd
	belongs_to :patient
end
