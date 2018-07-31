require "administrate/base_dashboard"

class DiabeteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    health_record: Field::BelongsTo,
    id: Field::Number,
    fasting_blood_glucose: Field::Number.with_options(decimals: 2),
    hg1ac: Field::Number.with_options(decimals: 2),
    meal: Field::Number,
    blood_glucose_level: Field::Number.with_options(decimals: 2),
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
    :health_record,
    :id,
    :fasting_blood_glucose,
    :hg1ac,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :health_record,
    :id,
    :fasting_blood_glucose,
    :hg1ac,
    :meal,
    :blood_glucose_level,
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
    :fasting_blood_glucose,
    :hg1ac,
    :meal,
    :blood_glucose_level,
    :medication,
    :notes,
  ].freeze

  # Overwrite this method to customize how diabetes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(diabete)
  #   "Diabete ##{diabete.id}"
  # end
end
