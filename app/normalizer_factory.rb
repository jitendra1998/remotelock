require_relative 'normalizer/people_normalizer'

class NormalizerFactory
  def initialize(normalizer_type)
    @normalizer_type = normalizer_type
  end

  def build
    if @normalizer_type == :people
      Normalizer::PeopleNormalizer.new
    else
      raise InvalidNormalizerType.new(@normalizer_type)
    end
  end

  # Todo: Move this to a separate error file for this project
  class InvalidNormalizerType < StandardError
    def initialize(normalizer_type)
      message = "Invalid #{@normalizer_type}. Please Check again"
      super(message)
    end
  end
end
