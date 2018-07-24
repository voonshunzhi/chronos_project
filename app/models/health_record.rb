class HealthRecord < ApplicationRecord
	has_many :hypertensions
	has_many :obeses
	has_many :diabetes
	belongs_to :patient
end
