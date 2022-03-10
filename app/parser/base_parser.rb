class Parser
  class BaseParser
    attr_reader :parsed_data
    def initialize
      @parsed_data = []
    end

    def parse(data)
      data_list = convert_data_string_into_list(data)
      headers_index_hash = generate_headers_index_hash(data_list.first)
      add_data_points_to_parsed_data(data_list[1..-1], headers_index_hash)
    end

    private

    def generate_headers_index_hash(headers)
      headers_index_hash = {}
      return headers_index_hash if headers.size == 0
      headers.each_with_index do |header_name, header_index|
        headers_index_hash[header_index] = header_name
      end
      headers_index_hash
    end

    def add_data_points_to_parsed_data(data_list, headers_index_hash)
      data_list.each do |data_line|
        data_hash = {}
        data_line.each_with_index do |data_point, data_point_index|
          data_hash[headers_index_hash[data_point_index]] = data_point
        end
        @parsed_data.push(data_hash)
      end
    end

    def clean_data_point(data_point)
      data_point.to_s.strip
    end
  end
end
