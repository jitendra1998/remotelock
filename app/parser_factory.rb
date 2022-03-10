require_relative 'parser/dollar_format_parser'
require_relative 'parser/percent_format_parser'

class ParserFactory
  def initialize(data_format)
    @data_format = data_format
  end

  def build
    if @data_format == :dollar_format
      Parser::DollarFormatParser.new
    elsif @data_format == :percent_format
      Parser::PercentFormatParser.new
    else
      # raise InvalidDataFormat.new(@data_format)
    end
  end
end
