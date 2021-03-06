require "administrate/base_dashboard"

class PatientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    doctor: Field::BelongsTo,
    health_record: Field::HasOne,
    name: NameField,
    age: AgeField,
    id: Field::Number,
    height: Field::Number.with_options(decimals: 2),
    weight: Field::Number.with_options(decimals: 2),
    blood_type: Field::String,
    points: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    identification_card: PticField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :age,
    :identification_card,
    :height,
    :weight,
    :points,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :identification_card,
    :id,
    :height,
    :weight,
    :blood_type,
    :points,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :doctor,
    :health_record,
    :height,
    :weight,
    :blood_type,
    :points,
  ].freeze

  # Overwrite this method to customize how patients are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(patient)
    "#{patient.user.name}"
  end
end
