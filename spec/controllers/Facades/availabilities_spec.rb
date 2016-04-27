require 'rails_helper'

RSpec.describe Facades::Availabilities, type: :facade do

  describe "#week_dates" do

    before(:all) do
      availabilities = []
      10.times { |i| availabilities << create(:availability) }
      @today = Date.new(2016,4,26)
      @facade = Facades::Availabilities.new(availabilities, @today)
      @week_count = 5

      @correct_dates = [
          %w[2016-04-25 2016-05-01],
          %w[2016-05-02 2016-05-08],
          %w[2016-05-09 2016-05-15]
      ]

    end

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

    before(:all) do
      @available_date_string = '2016-04-27'
      @available_date = Date.parse(@available_date_string)

      day = {
          day:        @available_date,
          time_from:  '2016-04-27 14:00:00',
          time_to:    '2016-04-27 22:00:00'
      }

      availabilities = [create(:availability, day)]
      @facade = Facades::Availabilities.new(availabilities, @today)
      @is_available = @facade.is_available?(@available_date)
    end

    it "returns hash" do
      expect(@is_available).to be_kind_of Hash
    end

    it "sets day to #{@available_date}" do
      expect(@is_available[:date]).to be == @available_date_string
    end

    context "when available" do

      it "sets disabled to false" do
        expect(@is_available[:disabled]).to be == false
      end

      it "sets time_from to 14:00" do
        expect(@is_available[:time_from]).to be == '14:00'
      end

      it "sets time_from to 22:00" do
        expect(@is_available[:time_to]).to be == '22:00'
      end

    end

    context "when not available" do

      before(:all) do
        @not_available_date = Date.parse('2016-04-28')
        @is_available = @facade.is_available?(@not_available_date)
      end

      it "sets disabled to true" do
        expect(@is_available[:disabled]).to be == true
      end

      it "sets time_from to 00:00" do
        expect(@is_available[:time_from]).to be == '00:00'
      end

      it "sets time_from to 00:00" do
        expect(@is_available[:time_to]).to be == '00:00'
      end

    end

  end

end