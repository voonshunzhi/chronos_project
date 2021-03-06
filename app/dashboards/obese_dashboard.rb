require "administrate/base_dashboard"

class ObeseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    health_record: Field::BelongsTo,
    patient_name: PtnameField,
    id: Field::Number,
    bmi: Field::Number.with_options(decimals: 2),
    waist_circumference: Field::Number.with_options(suffix: 'cm'),
    notes: Field::String,
    medication: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    weight: Field::Number.with_options(decimals: 2),
    height: Field::Number.with_options(decimals: 2),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :patient_name,
    :medication,
    :bmi,
    :waist_circumference,
    :updated_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :patient_name,
    :id,
    :bmi,
    :waist_circumference,
    :notes,
    :medication,
    :weight,
    :height,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :health_record,
    :bmi,
    :waist_circumference,
    :notes,
    :medication,
    :weight,
    :height,
  ].freeze

  # Overwrite this method to customize how obeses are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(obese)
     "Weight Record ##{obese.health_record.patient.user.name}"
    # "Obese ##{obese.id}"
  end
end
