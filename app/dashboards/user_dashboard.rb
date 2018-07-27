require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    patient: Field::HasOne,
    doctor: Field::HasOne,
    id: Field::Number,
    name: Field::String,
    age: Field::Number,
    ic: Field::String,
    gender: Field::String,
    phone: Field::String,
    email: Field::String,
    role: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    encrypted_password: Field::String,
    confirmation_token: Field::String,
    remember_token: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :patient,
    :doctor,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :patient,
    :doctor,
    :id,
    :name,
    :age,
    :ic,
    :gender,
    :phone,
    :email,
    :role,
    :created_at,
    :updated_at,
    :encrypted_password,
    :confirmation_token,
    :remember_token,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :patient,
    :doctor,
    :name,
    :age,
    :ic,
    :gender,
    :phone,
    :email,
    :role,
    :encrypted_password,
    :confirmation_token,
    :remember_token,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end

end
