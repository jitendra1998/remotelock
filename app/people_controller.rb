require_relative 'parser_factory'
require_relative 'normalizer/people_normalizer'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    results = []
    @params.each do |format, peoples_information|
      next unless format.to_s.include?('format')
      parser = ParserFactory.new(format).build
      parser.parse(peoples_information)
      results += parser.parsed_data
    end
    Normalizer::PeopleNormalizer.new(results, ['first_name', 'city', 'birthdate']).normalize_data
  end

  private

  attr_reader :params

  def permitted_params
    params.transform_keys(&:to_sym).slice(:dollar_format, :percent_format, :order)
  end
end
