class HealthRecord < ApplicationRecord
  has_many :obeses
  has_many :diabetes
  has_many :hypertensions
  belongs_to :patient
end
