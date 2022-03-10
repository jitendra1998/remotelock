class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    results = []
    @params.each do |format, peoples_information|
      parser = ParserFactory.build(format)
      parser.parse(peoples_information)
      result.push(parser.parsed_data)
    end
    PeopleNormalizer.normalize_data(results)
  end

  private

  attr_reader :params
end
