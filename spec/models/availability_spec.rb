# == Schema Information
#
# Table name: availabilities
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  day         :date             not null
#  time_from   :datetime         not null
#  time_to     :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_availabilities_on_employee_id  (employee_id)
#

require 'rails_helper'

RSpec.describe Availability, type: :model do

  let(:availability) { build(:availability) }

  it_is_expected_to_validate_presence_for(
      :day,
      :time_from,
      :time_to
  )

  describe "Save availability" do

    let(:availability) { build(:availability) }

    context "with invalid attributes" do
      it "fails" do
        [:day, :time_from, :time_to].each do |attr|
          availability.send("#{attr}=", 'invalid_datetime')
          expect(availability.save).to be_falsey
        end
      end
    end

    context "with valid attributes" do
      it "passes" do
        expect { availability.save }.to change(Availability, :count).by(1)
      end
    end
  end


end
