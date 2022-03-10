require 'date'

class Normalizer
  class PeopleNormalizer
    def initialize(data, fields)
      @data = data
      @fields = fields
    end

    def normalize_data
      normalized_result = []
      @data.each do |data_hash|
        data_list = []
        @fields.each do |field|
          if field == 'birthdate'
            data_hash[field] = Date.parse(data_hash[field]).strftime("%-m/%-d/%Y")
          end
          data_list.push(data_hash[field])
        end
        normalized_result.push(data_list.join(", "))
      end
      normalized_result
    end
  end
end
