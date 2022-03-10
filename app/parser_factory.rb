class ParserFactory
  def initialize(data_format)
    @data_format = data_format
  end

  def build
    if @data_format == :dollar_format
      DollarFormatParser.new
    elsif @data_format == :percent_format
      PercentFormatParser.new
    else
      raise InvalidDataFormat.new(@data_format)
    end
  end
end
