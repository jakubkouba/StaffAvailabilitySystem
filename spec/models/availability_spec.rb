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

  before do
    @employee = create(:post_request_employee)

    @available_times = {
        "2016-03-24" => {
            "from" => '13:45',
            "to"   => '23:30'
        },
        "2016-03-25" => {
            "from" => '07:45',
            "to"   => '23:30'
        }
    }

    @available_times_invalid = {
        "2016-03-24" => {
            "from" => 'invalid',
            "to"   => '23:30'
        },
        "2016-03-25" => {
            "from" => 'invalid',
            "to"   => '23:30'
        }
    }
  end

  it_is_expected_to_validate_presence_for(
      :day,
      :time_from,
      :time_to
  )

  it "creates Time object from string" do
    expect(described_class.create_time_obj(@available_times["2016-03-24"]["from"])).to match /\d{2}:\d{2}:00/
  end

  it "fails to crate Time object from invalid string" do
    %w[ 6:30 70:45 10:99 'invalid' ].each do |time|
      expect(Availability.create_time_obj(time)).to be_nil
    end
  end

  describe "::create_collection" do

    context "with invalid request params" do

      it "returns empty array" do
        expect(Availability.create_collection(@available_times_invalid, @employee.id)).to be_empty
      end

    end

    context "with valid request params" do

      it "creates availability collection" do
        collection = Availability.create_collection(@available_times, @employee.id)
        expect(collection).to be_instance_of(Array)
        expect(collection.size).to eq 2
      end

    end

  end



  describe "::update" do

    context "with valid request params" do

      it "updates availability" do
        expect { Availability.update(@available_times, @employee.id) }.to change(Availability, :count).by(@available_times.size)
      end

      it "update correct time" do
        Availability.update(@available_times, @employee.id)
        availability = Availability.find_by_day('2016-03-24')
        expect(availability.time_from.to_formatted_s(:time)).to eq @available_times['2016-03-24']["from"]

      end

    end

    context "with invalid request params" do

      it "returns false" do
        result = Availability.update(@available_times_invalid, @employee.id)
        expect(result).to be_falsey
      end

    end

  end

end
