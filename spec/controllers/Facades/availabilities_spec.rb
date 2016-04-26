require 'rails_helper'

RSpec.describe Facades::Availabilities, type: :facade do

  before do
    availabilities = []
    10.times { |i| availabilities << create(:availability) }
    @date = Date.new(2016,4,26)
    @available_date = Date.new(2016,4,28)
    @facade = Facades::Availabilities.new(availabilities, @date)

    @correct_dates = [
        %w[2016-04-25 2016-05-01],
        %w[2016-05-02 2016-05-08],
        %w[2016-05-09 2016-05-15]
    ]

    @week_count = 5
  end

  describe "#week_dates" do

    it "returns array of three elements as default" do
      expect(@facade.week_dates.size).to be == 3
    end

    it "returns array of #{@week_count} elements" do
      expect(@facade.week_dates(@week_count).size).to be == @week_count
    end

    it "returns correct dates" do
      week_dates = @facade.week_dates
      3.times do |week|
        2.times { |i| expect(week_dates[week][i]).to be == Date.parse(@correct_dates[week][i]) }
      end
    end

  end

  describe "#is_available" do

    context "when available" do

      let(:availabilities) { [ create(:availability, day: @available_date) ]}
      let(:facade) { Facades::Availabilities.new(availabilities, @date)}

      it "returns hash" do
        expect(facade.is_available?(@available_date)).to be_kind_of Hash
      end

      it "sets disabled to false" do
        expect(facade.is_available?(@available_date)[:disabled]).to be == false
      end

      it "sets day to #{@available_date}"

    end
  end

end