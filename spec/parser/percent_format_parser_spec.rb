require 'spec_helper'

RSpec.describe 'PercentFormatParser Unit Test' do
  describe 'percent format is converted into parsed list of data' do
    let(:data) { File.read('spec/fixtures/people_by_percent.txt') }
    let(:parser) { Parser::PercentFormatParser.new }

    it 'parses input data and outputs parsed list of data' do
      parser.parse(data)
      parsed_data = parser.parsed_data


      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(parsed_data).to eq [
        {
          "birthdate"=>"1986-05-29",
          "city"=>"Atlanta",
          "first_name"=>"Mckayla"
        },
        {
          "birthdate"=>"1947-05-04",
          "city"=>"New York City",
          "first_name"=>"Elliot"
        }
      ]
    end
  end
end
