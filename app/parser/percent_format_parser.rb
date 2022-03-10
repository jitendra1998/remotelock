require_relative 'base_parser'

class Parser
  class PercentFormatParser < BaseParser
    private

    def convert_data_string_into_list(data)
      data.split("\n").map do |data_list|
        data_list.split("%").map { |data_point| clean_data_point(data_point) }
      end
    end
  end
end
