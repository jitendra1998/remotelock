require_relative 'parser_factory'
require_relative 'normalizer_factory'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    parsed_data = []
    permitted_params.each do |format, peoples_information|
      next unless format.to_s.include?('format')
      parser = ParserFactory.new(format).build
      parser.parse(peoples_information)
      parsed_data += parser.parsed_data
    end
    # Todo: Integrate this sorting logic inside Normalizer class, once it's clear what are it's all possible use cases
    parsed_data = parsed_data.sort_by { |data| data[permitted_params[:order].to_s] }
    normalizer = NormalizerFactory.new(:people).build
    normalizer.normalize_data(parsed_data, ['first_name', 'city', 'birthdate'])
  end

  private

  attr_reader :params

  def permitted_params
    params.transform_keys(&:to_sym).slice(:dollar_format, :percent_format, :order)
  end
end
