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

  enum :shirt_size => INIT_VALS[:shirt_sizes]

  attr_accessor :password

  validates :name,
            :surname,
            :date_of_birth,
            :email,
            :password_hash,
            :password_salt, presence: true

  validates :email, email: true

  validates :shirt_size, inclusion: {
      in:      INIT_VALS[:shirt_sizes],
      message: "Select from following values #{INIT_VALS[:shirt_sizes].join(' ')}"
  }

  validates :password,
            presence: true,
            format:   { with: %r{\A[a-zA-z0-9]{6,20}\z} }

  # validates :date_of_birth,
  #           format: { with: %r{\A\d{2}/\d{2}/\d{4}\z}, message: 'Enter your date of birth in format dd/mm/yyyy' }
end
