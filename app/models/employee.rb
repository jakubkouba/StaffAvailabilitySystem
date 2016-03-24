# == Schema Information
#
# Table name: employees
#
#  id            :integer          not null, primary key
#  name          :string(64)       not null
#  surname       :string(64)       not null
#  date_of_birth :date             not null
#  email         :string(64)       not null
#  shirt_size    :integer          default(0)
#  password_hash :string(128)      not null
#  password_salt :string(128)      not null
#  last_login    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Employee < ActiveRecord::Base

  has_and_belongs_to_many :staff_types, join_table: 'positions'
  has_and_belongs_to_many :access_levels, join_table: 'authorizations'
  has_many :availabilities

  enum :shirt_size => INIT_VALS[:shirt_sizes]

  attr_accessor :password, :dob

  before_save :create_password_hash,
              :set_default_access_level,
              :normalize_name

  after_validation :set_date_of_birth


  validates :name,
            :surname,
            :dob,
            :email,
            :password,
            :password_confirmation, presence: true

  validates :staff_types, presence: { message: 'Select Staff Type' }

  validates :name, :surname, alpha: true

  validates :email, email: true

  validates :password,
            format:       { with: %r{\A[a-zA-z0-9]{6,20}\z} },
            confirmation: { message: 'is incorrect' }


  validates :dob,
            format: {
                with: %r{\A\d{2}/\d{2}/\d{4}\z},
                message: 'Enter your date of birth in format dd/mm/yyyy'
            }

  class << self
    ##
    # Authenticates employee
    # @param email
    # @param password
    #
    def authenticate(email, password)
      employee = self.find_by_email(email)
      if employee && employee.password_hash = BCrypt::Engine.hash_secret(password, employee.password_salt)
        employee
      else
        nil
      end
    end
  end

  def create_password_hash
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def set_default_access_level
    default_access_level = AccessLevel.find_by_title('staff')
    self.access_levels << default_access_level if self.access_levels.empty?
  end

  def normalize_name
    normalize    = Proc.new { |string| string.downcase.titleize }
    self.name    = normalize.call(self.name)
    self.surname = normalize.call(self.surname)
  end

  def set_date_of_birth
    self.date_of_birth = dob
  end

end
