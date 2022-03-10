class Parser
  class DollarFormatParser
    attr_reader :parsed_data
    def initialize
      @parsed_data = []
    end

    def parse(data)
      headers_index_hash = parse_headers(data)
      parse_data_points(data, headers_index_hash)
    end

    private

    def parse_headers(data)
      headers_index_hash = {}
      header_data_line = data.split("\n").first
      return headers_index_hash if header_data_line.to_s.empty?
      header_data_line.split('$').each_with_index do |header_name, header_index|
        headers_index_hash[header_index] = header_name.to_s.strip
      end
      headers_index_hash
    end

    def parse_data_points(data, headers_index_hash)
      data.split("\n").drop(1).each do |data_line|
        data_hash = {}
        data_line.split('$').each_with_index do |data_point, data_point_index|
          data_hash[headers_index_hash[data_point_index]] = data_point.to_s.strip
        end
        @parsed_data.push(data_hash)
      end
    end
  end
end
