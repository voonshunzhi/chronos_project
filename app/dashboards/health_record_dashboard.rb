require "administrate/base_dashboard"

class HealthRecordDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    obeses: Field::HasMany,
    diabetes: Field::HasMany,
    hypertensions: Field::HasMany,
    patient: Field::BelongsTo,
    id: Field::Number,
    name: NamehrField,
    obese: Field::Boolean,
    total_weight_records: HrobeseField,
    total_glucose_records: HrdiabetesField,
    total_blood_pressure_records: HrhypertensionField,
    diabete: Field::Boolean,
    hypertension: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :total_weight_records,
    :total_glucose_records,
    :total_blood_pressure_records,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :obeses,
    :diabetes,
    :hypertensions,
    :patient,
    :id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :obeses,
    :diabetes,
    :hypertensions,
    :patient,
    :obese,
    :diabete,
    :hypertension,
  ].freeze

  # Overwrite this method to customize how health records are displayed
  # across all pages of the admin dashboard.

  # def display_resource(health_record)
  #   "HealthRecord ##{health_record.id}"
  # end
end
