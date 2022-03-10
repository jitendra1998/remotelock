require 'spec_helper'

RSpec.describe 'DollarFormatParser Unit Test' do
  describe 'dollar format is converted into parsed list of data' do
    let(:data) { File.read('spec/fixtures/people_by_dollar.txt') }
    let(:parser) { Parser::DollarFormatParser.new }

    it 'parses input data and outputs parsed list of data' do
      parser.parse(data)
      parsed_data = parser.parsed_data


      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(parsed_data).to eq [
        {
          "birthdate"=>"30-4-1974",
          "city"=>"Los Angeles",
          "first_name"=>"Rhiannon",
          "last_name"=>"Nolan"
        },
        {
          "birthdate"=>"5-1-1962",
          "city"=>"New York City",
          "first_name"=>"Rigoberto",
          "last_name"=>"Bruen"
        }
      ]
    end
  end
end
