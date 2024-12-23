class Profile < ApplicationRecord
  # attr_accessor :custom_field
  belongs_to :user
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 24 } # length: { in: 2..24 }
  validates :age, numericality: { only_integer: true, greater_than: 13 }, allow_blank: true, on: :update
  # validate :must_be_min_age # 13

  def age
    return unless birthday
    today = Date.current
    age = today.year - birthday.year
    age -= 1 if birthday > today - age.years # Subtract 1 if birthday hasn't occurred yet this year
    age
  end

  # Before validation or after initialization, ensure the gender defaults to 'Other' if it's invalid
  # validates :gender, inclusion: { in: [ nil, "Male", "Female", "Other" ], allow_nil: true }

  # # Set a default value of 'Other' if the gender is not one of the valid options
  # after_initialize :set_default_gender, if: :new_record?

  private

  # def set_default_gender
  #   self.gender ||= "Other"
  # end

  # Custom validation to ensure age is >= 13
  def must_be_min_age
    return unless birthday
    if birthday > 13.years.ago
      errors.add(:birthday, "You must be at least 13 years old.")
    end
  end


  # validates_presence_of :username
  # validates :username, presence: { message: "is required for registration" }
  # validates :location, presence: { message: "is required for registration" }
  # add_index :users, :username, unique: true
  # Validation for username
  # validates :username, presence: { message: "Username must be present, unique, and between 2 to 24 characters long" },
  #                      uniqueness: { case_sensitive: false, message: "Username must be unique" },
  #                      length: { in: 2..24, message: "Username must be between 2 and 24 characters long" }

  # # Validation for age
  # validates :age, numericality: { only_integer: true, greater_than: 18, message: "Age must be a number greater than 18" },
  #                 allow_blank: true,
  #                 on: :update
end
