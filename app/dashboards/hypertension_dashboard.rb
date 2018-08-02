require "administrate/base_dashboard"

class HypertensionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    health_record: Field::BelongsTo,
    id: Field::Number,
    blood_pressure: BpField,
    patient_name: PtnameField,
    SBP: Field::Number.with_options(decimals: 2),
    DBP: Field::Number.with_options(decimals: 2),
    medication: Field::String,
    notes: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :patient_name,
    :medication,
    :blood_pressure,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :health_record,
    :id,
    :blood_pressure,
    :medication,
    :notes,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :health_record,
    :SBP,
    :DBP,
    :medication,
    :notes,
  ].freeze

  # Overwrite this method to customize how hypertensions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(hypertension)
  #   "Hypertension ##{hypertension.id}"
  # end
end
